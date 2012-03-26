`timescale 1ns / 1ps

/*
	PS/2 Transmission module
	(c) C.c, DZTC 2012
*/

module PS2Tx
(
	inout wire PS2Clk,
	inout wire PS2Data,
	
	input wire Clk,
	input wire Reset,
	
	input wire Write,
	input wire [7:0] Data,
	
	// debug purposes
	//output wire [7:0] State,
	
	output reg Done,
	output wire Idle	

);

/* States */
`define STATE_WIDTH 7:0
localparam [`STATE_WIDTH]
	st_idle					= 0,
	st_tt_await				= 1,
	st_begin_transmit		= 2,
	st_set_start_bit		= 3,
	st_await_device_ack	= 4,
	st_transmit_bits		= 5,
	st_set_done				= 6;

reg [`STATE_WIDTH] c_state, n_state;


wire [10:0] data_i;

PS2TxByteParity bp_logic
(
	.Data(Data),
	.Q(data_i)
);

wire shift_en;
reg ps2c_out, ps2c_z;
wire ps2d_out;

PS2TxShiftreg shift_r 
(
	.Done(sh_done),
	.Q(ps2d_out),
	.Data(data_i),
	.Write(Write),
	.ShiftEn(shift_en),
	.ShiftClk(PS2Clk)
);

always @(posedge Clk, 
		posedge Reset 
		or posedge Write )
begin
	if (Reset)
	begin
		c_state <= st_idle;
	end 
	
	else if (Write)
	begin
		c_state <= st_begin_transmit;
	end
	
	else if (PS2Clk)
	begin
		if (c_state == st_await_device_ack)
		begin
			c_state <= st_set_done;
		end
	end else c_state <= n_state;
end


/* Clock hold timer */ 
parameter [15:0] TMR_DELAY = 5000; /* 100 us on 50 mhz */

wire tmr_done;
reg  tmr_start;

Timer hold_tmr
(
	.Clk(Clk),
	.Done(tmr_done),
	.Start(tmr_start),
	.Interval(TMR_DELAY)
);

/* ps2c posedge detector */



/* Main state machine */


always @*
begin

	n_state = c_state;
	tmr_start = 1'b0;
	Done = 1'b0;
	
	case (c_state)
		
		st_begin_transmit:
			begin
				tmr_start = 1'b1;
				ps2c_out = 1'b0;
				ps2c_z = 1'b0;
				n_state = st_tt_await;
			end
			
		st_tt_await:
			begin
				if (tmr_done)
					begin
						ps2c_z = 1'b1;
						n_state = st_transmit_bits;
					end
			end
			
		st_transmit_bits:
			begin
				if (sh_done)
				begin
					n_state = st_await_device_ack;
				end
			end
		
		st_await_device_ack:
			begin
				
			end
			
		st_set_done:
			begin
				Done = 1'b1;
				n_state = st_idle;
			end
			
		st_idle:
			begin
				
			end
	endcase
	
end


/* Idle & State */
assign Idle = c_state == st_idle;

// debug purposes
//assign State = c_state;


/* PS/2 lines and tri-state logic */
wire ps2d_z;

assign PS2Clk = ps2c_z ? 1'bZ : ps2c_out;
assign PS2Data = ps2d_z ? 1'bZ : ps2d_out;

assign shift_en = c_state == st_transmit_bits;
assign ps2d_z = !shift_en;

endmodule
