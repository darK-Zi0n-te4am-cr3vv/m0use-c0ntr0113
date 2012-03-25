/*
	stolen from opencores
	now i'm trying to get into this shit
		-- C.c
*/

`resetall
`timescale 1ns/100ps
 
`define TOTAL_BITS	 33	// Number of bits in one full packet
 
 
module ps2_mouse_interface 
(
	input clk,
	input reset,
		
	inout ps2_clk,
	inout ps2_data,
	
	output left_button,
	output right_button,
	output [8:0] x_increment,
	output [8:0] y_increment,
	output data_ready,			 // rx_read_o
	output read,						 // rx_read_ack_i
	output error_no_ack
);
	
// Parameters
 
// The timer value can be up to (2^bits) inclusive.
parameter WATCHDOG_TIMER_VALUE_PP = 20000; // Number of sys_clks for 400usec.
parameter WATCHDOG_TIMER_BITS_PP	= 15;		// Number of bits needed for timer
parameter DEBOUNCE_TIMER_VALUE_PP = 186;	 // Number of sys_clks for debounce
parameter DEBOUNCE_TIMER_BITS_PP	= 8;		 // Number of bits needed for timer
 
 
// State encodings, provided as parameters
// for flexibility to the one instantiating the module.
// In general, the default values need not be changed.
 
// There are three state machines: m1, m2 and m3.
// States chosen as "default" states upon power-up and configuration:
//		"m1_clk_h"
//		"m2_wait"
//		"m3_data_ready_ack"
 
parameter m1_clk_h = 0;
parameter m1_falling_edge = 1;
parameter m1_falling_wait = 3;
parameter m1_clk_l = 2;
parameter m1_rising_edge = 6;
parameter m1_rising_wait = 4;
 
parameter m2_reset = 14;
parameter m2_wait = 0;
parameter m2_gather = 1;
parameter m2_verify = 3;
parameter m2_use = 2;
parameter m2_hold_clk_l = 6;
parameter m2_data_low_1 = 4;
parameter m2_data_high_1 = 5;
parameter m2_data_low_2 = 7;
parameter m2_data_high_2 = 8;
parameter m2_data_low_3 = 9;
parameter m2_data_high_3 = 11;
parameter m2_error_no_ack = 15;
parameter m2_await_response = 10;
 
parameter m3_data_ready = 1;
parameter m3_data_ready_ack = 0;
 

 
reg left_button;
reg right_button;
reg [8:0] x_increment;
reg [8:0] y_increment;
reg data_ready;
reg error_no_ack;
 
// Internal signal declarations
wire watchdog_timer_done;
wire debounce_timer_done;
wire packet_good;
 
reg [`TOTAL_BITS-1:0] q;	// Shift register
reg [2:0] m1_state;
reg [2:0] m1_next_state;
reg [3:0] m2_state;
reg [3:0] m2_next_state;
reg m3_state;
reg m3_next_state;

reg [5:0] bit_count;			// Bit counter
reg [WATCHDOG_TIMER_BITS_PP-1:0] watchdog_timer_count;
reg [DEBOUNCE_TIMER_BITS_PP-1:0] debounce_timer_count;
reg ps2_clk_hi_z;		 // Without keyboard, high Z equals 1 due to pullups.
reg ps2_data_hi_z;		// Without keyboard, high Z equals 1 due to pullups.
reg clean_clk;				// Debounced output from m1, follows ps2_clk.
reg rising_edge;			// Output from m1 state machine.
reg falling_edge;		 // Output from m1 state machine.
reg output_strobe;		// Latches data data into the output registers
 
//--------------------------------------------------------------------------
// Module code
 
assign ps2_clk = ps2_clk_hi_z?1'bZ:1'b0;
assign ps2_data = ps2_data_hi_z?1'bZ:1'b0;
 
// State register
always @(posedge clk)
begin : m1_state_register
	if (reset) m1_state <= m1_clk_h;
	else m1_state <= m1_next_state;
end
 
// State transition logic
always @(
	m1_state
	or ps2_clk
	or debounce_timer_done
	or watchdog_timer_done
)
begin : m1_state_logic
 
	// Output signals default to this value, unless changed in a state condition.
	clean_clk <= 0;
	rising_edge <= 0;
	falling_edge <= 0;
 
	case (m1_state)
		m1_clk_h :
			begin
				clean_clk <= 1;
				if (~ps2_clk) m1_next_state <= m1_falling_edge;
				else m1_next_state <= m1_clk_h;
			end
 
		m1_falling_edge :
			begin
				falling_edge <= 1;
				m1_next_state <= m1_falling_wait;
			end
 
		m1_falling_wait :
			begin
				if (debounce_timer_done) m1_next_state <= m1_clk_l;
				else m1_next_state <= m1_falling_wait;
			end
 
		m1_clk_l :
			begin
				if (ps2_clk) m1_next_state <= m1_rising_edge;
				else m1_next_state <= m1_clk_l;
			end
 
		m1_rising_edge :
			begin
				rising_edge <= 1;
				m1_next_state <= m1_rising_wait;
			end
 
		m1_rising_wait :
			begin
				clean_clk <= 1;
				if (debounce_timer_done) m1_next_state <= m1_clk_h;
				else m1_next_state <= m1_rising_wait;
			end
		default : m1_next_state <= m1_clk_h;
	endcase
end
 
 
// State register
always @(posedge clk)
begin : m2_state_register
	if (reset) m2_state <= m2_reset;
	else m2_state <= m2_next_state;
end
 
// State transition logic
always @(m2_state
				 or q
				 or falling_edge
				 or rising_edge
				 or watchdog_timer_done
				 or bit_count
				 or packet_good
				 or ps2_data
				 or clean_clk
				 )
begin : m2_state_logic
 
	// Output signals default to this value, unless changed in a state condition.
	ps2_clk_hi_z <= 1;
	ps2_data_hi_z <= 1;
	error_no_ack <= 0;
	output_strobe <= 0;
 
	case (m2_state)
 
		m2_reset :		// After reset, sends command to mouse.
			begin
				m2_next_state <= m2_hold_clk_l;
			end
 
		m2_wait :
			begin
				if (falling_edge) m2_next_state <= m2_gather;
				else m2_next_state <= m2_wait;
			end
 
		m2_gather :
			begin
				if (watchdog_timer_done && (bit_count == `TOTAL_BITS))
					m2_next_state <= m2_verify;
				else if (watchdog_timer_done && (bit_count < `TOTAL_BITS))
					m2_next_state <= m2_hold_clk_l;
				else m2_next_state <= m2_gather;
			end
 
		m2_verify :
			begin
				if (packet_good) m2_next_state <= m2_use;
				else m2_next_state <= m2_wait;
			end
 
		m2_use :
			begin
				output_strobe <= 1;
				m2_next_state <= m2_wait;
			end
 
		// The following sequence of 9 states is designed to transmit the
		// "enable streaming mode" command to the mouse, and then await the
		// response from the mouse.	Upon completion of this operation, the
		// receive shift register contains 22 bits of data which are "invalid"
		// therefore, the m2_verify state will fail to validate the data, and
		// control will be passed into the m2_wait state once again (but the
		// mouse will then be enabled, and valid data packets will ensue whenever
		// there is activity on the mouse.)
		m2_hold_clk_l :
			begin
				ps2_clk_hi_z <= 0;	 // This starts the watchdog timer!
				if (watchdog_timer_done && ~clean_clk) m2_next_state <= m2_data_low_1;
				else m2_next_state <= m2_hold_clk_l;
			end
 
		m2_data_low_1 :
			begin
				ps2_data_hi_z <= 0;	// Forms start bit, d[0] and d[1]
				if (rising_edge && (bit_count == 3))
					m2_next_state <= m2_data_high_1;
				else m2_next_state <= m2_data_low_1;
			end
 
		m2_data_high_1 :
			begin
				ps2_data_hi_z <= 1;	// Forms d[2]
				if (rising_edge && (bit_count == 4))
					m2_next_state <= m2_data_low_2;
				else m2_next_state <= m2_data_high_1;
			end
 
		m2_data_low_2 :
			begin
				ps2_data_hi_z <= 0;	// Forms d[3]
				if (rising_edge && (bit_count == 5))
					m2_next_state <= m2_data_high_2;
				else m2_next_state <= m2_data_low_2;
			end
 
		m2_data_high_2 :
			begin
				ps2_data_hi_z <= 1;	// Forms d[4],d[5],d[6],d[7]
				if (rising_edge && (bit_count == 9))
					m2_next_state <= m2_data_low_3;
				else m2_next_state <= m2_data_high_2;
			end
 
		m2_data_low_3 :
			begin
				ps2_data_hi_z <= 0;	// Forms parity bit
				if (rising_edge) m2_next_state <= m2_data_high_3;
				else m2_next_state <= m2_data_low_3;
			end
 
		m2_data_high_3 :
			begin
				ps2_data_hi_z <= 1;	// Allow mouse to pull low (ack pulse)
				if (falling_edge && ps2_data) m2_next_state <= m2_error_no_ack;
				else if (falling_edge && ~ps2_data)
					m2_next_state <= m2_await_response;
				else m2_next_state <= m2_data_high_3;
			end
 
		m2_error_no_ack :
			begin
				error_no_ack <= 1;
				m2_next_state <= m2_error_no_ack;
			end
 
		// In order to "cleanly" exit the setting of the mouse into "streaming"
		// data mode, the state machine should wait for a long enough time to
		// ensure the FA response is done being sent by the mouse.	Unfortunately,
		// this is tough to figure out, since the watchdog timeout might be longer
		// or shorter depending upon the user.	If the watchdog timeout is set to
		// a small enough value (less than about 560 usec?) then the bit_count
		// will get reset to zero by the watchdog before the FA response is
		// received.	In that case, bit_count will be 11.
		// If the bit_count is not reset by the watchdog, then the
		// total bit_count will be 22.
		// In either case, when this state is reached, the watchdog timer is still
		// running and it is best to let it expire before returning to normal
		// operation.	One easy way to do this is to check for the bit_count to
		// reach 22 (which it will always do when receiving a normal packet) and
		// then jump to "verify" which will always fail for that time.
		m2_await_response :
			begin
				if (bit_count == 22) m2_next_state <= m2_verify;
				else m2_next_state <= m2_await_response;
			end
 
		default : m2_next_state <= m2_wait;
	endcase
end
 
 
 
// State register
always @(posedge clk)
begin : m3_state_register
	if (reset) m3_state <= m3_data_ready_ack;
	else m3_state <= m3_next_state;
end
 
// State transition logic
always @(m3_state or output_strobe or read)
begin : m3_state_logic
	case (m3_state)
		m3_data_ready_ack:
					begin
						data_ready <= 1'b0;
						if (output_strobe) m3_next_state <= m3_data_ready;
						else m3_next_state <= m3_data_ready_ack;
					end
		m3_data_ready:
					begin
						data_ready <= 1'b1;
						if (read) m3_next_state <= m3_data_ready_ack;
						else m3_next_state <= m3_data_ready;
					end
		default : m3_next_state <= m3_data_ready_ack;
	endcase
end
 
// This is the bit counter
always @(posedge clk)
begin
	if (reset) bit_count <= 0;	// normal reset
	else if (falling_edge) bit_count <= bit_count + 1;
	else if (watchdog_timer_done) bit_count <= 0;	// rx watchdog timer reset
end
 
// This is the shift register
always @(posedge clk)
begin
	if (reset) q <= 0;
	else if (falling_edge) q <= {ps2_data,q[`TOTAL_BITS-1:1]};
end
 
// This is the watchdog timer counter
// The watchdog timer is always "enabled" to operate.
always @(posedge clk)
begin
	if (reset || rising_edge || falling_edge) watchdog_timer_count <= 0;
	else if (~watchdog_timer_done)
		watchdog_timer_count <= watchdog_timer_count + 1;
end
assign watchdog_timer_done = (watchdog_timer_count==WATCHDOG_TIMER_VALUE_PP-1);
 
// This is the debounce timer counter
always @(posedge clk)
begin
	if (reset || falling_edge || rising_edge) debounce_timer_count <= 0;
//	else if (~debounce_timer_done)
	else debounce_timer_count <= debounce_timer_count + 1;
end
assign debounce_timer_done = (debounce_timer_count==DEBOUNCE_TIMER_VALUE_PP-1);
 
// This is the logic to verify that a received data packet is "valid"
// or good.
assign packet_good = (
												 (q[0]	== 0)
											&& (q[10] == 1)
											&& (q[11] == 0)
											&& (q[21] == 1)
											&& (q[22] == 0)
											&& (q[32] == 1)
											&& (q[9]	== ~^q[8:1])		// odd parity bit
											&& (q[20] == ~^q[19:12])	// odd parity bit
											&& (q[31] == ~^q[30:23])	// odd parity bit
											);
 
// Output the special scan code flags, the scan code and the ascii
always @(posedge clk)
begin
	if (reset)
	begin
		left_button <= 0;
		right_button <= 0;
		x_increment <= 0;
		y_increment <= 0;
	end
	else if (output_strobe)
	begin
		left_button <= q[1];
		right_button <= q[2];
		x_increment <= {q[5],q[19:12]};
		y_increment <= {q[6],q[30:23]};
	end
end
 
 
endmodule
 
//`undefine TOTAL_BITS