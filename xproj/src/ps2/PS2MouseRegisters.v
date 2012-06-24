`timescale 1ns / 1ps


module PS2MouseRegisters
(
	/* common */
	input wire Clk,
	input wire Reset,

   /* ps2 signals */
	inout wire PS2Clk,
	inout wire PS2Data,
	
	/* io */
	input wire [7:0] ReadAddress,
	input wire [7:0] WriteAddress,
	
	output wire [31:0] DataOut,
	input wire [31:0] DataIn,
	input wire WriteData,
	
	/* status */
	output wire ENoReadReg,
	output wire ENoWriteReg,
	output wire ENoAck
);


/* register addreses */

localparam [7:0]
	a_pos_x   = 8'h00,
	a_pos_y   = 8'h01,
	a_state   = 8'h02,
	a_scale_x = 8'h03,
	a_scale_y = 8'h04;
	
	
/* addresses */

wire r_ad_pos_x = ReadAddress == a_pos_x;
wire r_ad_pos_y = ReadAddress == a_pos_y;
wire r_ad_state = ReadAddress == a_state;
wire r_ad_scale_x = ReadAddress == a_scale_x;
wire r_ad_scale_y = ReadAddress == a_scale_y;

wire 
	m_btLeft, 
	m_btRight, 
	m_btMiddle,
	m_data_ready
;
	
wire [8:0]
	m_x_increment,
	m_y_increment
;
	
wire 
	m_error_no_ack;
	
	
wire [31:0] m_status;
	
assign m_status[0] = m_btLeft;
assign m_status[1] = m_btRight;
assign m_status[2] = m_btMiddle;
assign m_status[3] = m_x_increment[8];
assign m_status[4] = m_y_increment[8];
assign m_status[5] = m_error_no_ack;

assign m_status[31:6] = 0;


reg [31:0] 
	r_status,	
	r_pos_x,
	r_pos_y,
	r_scale_x,
	r_scale_y
;
	
	
wire [31:0] scaled_pos_x = 
	r_scale_x[5] ? 
		r_pos_x >> r_scale_x[4:0] :  
		r_pos_x << r_scale_x[4:0]
;	

wire [31:0] scaled_pos_y = 
	r_scale_y[5] ? 
		r_pos_y >> r_scale_y[4:0] :  
		r_pos_y << r_scale_y[4:0]
;	


/* output data */	
assign DataOut = 
	r_ad_pos_x   ? scaled_pos_x :
	r_ad_pos_y   ? scaled_pos_y :
	r_ad_state   ? r_status     :
	r_ad_scale_x ? r_scale_x    :
	r_ad_scale_y ? r_scale_y    :
	
	32'h00000000
;

assign ENoWriteReg = (WriteAddress > 8'h04 || WriteAddress != a_state);
assign ENoReadReg  = (ReadAddress > 8'h04);

wire i_write_data = WriteData;

always @(posedge Reset, posedge m_data_ready, posedge i_write_data)
begin
	if (Reset)
	begin
		r_status  <= 32'h00000000;
		r_pos_x   <= 32'h00000000;
		r_pos_y   <= 32'h00000000;
		
		r_scale_x <= 32'h00000000;
		r_scale_y <= 32'h00000000;
	end
	
	else if (m_data_ready)
	begin
		r_status <= m_status;
		
		r_pos_x <= r_pos_x + m_x_increment;
		r_pos_y <= r_pos_y + m_y_increment;
	end
	
	else if (i_write_data)
	begin
		case (WriteAddress)
		
			a_pos_x :
			begin
				r_pos_x <= r_scale_x[5] ? 
					r_pos_x << r_scale_x[4:0] :  
					r_pos_x >> r_scale_x[4:0] ;
			end
		
			a_pos_y :
			begin
				r_pos_y <= r_scale_y[5] ? 
					DataIn << r_scale_y[4:0] :  
					Datain >> r_scale_y[4:0] ;
			end
			
			a_scale_x :
			begin
				r_scale_x <= DataIn;
			end
		
			a_scale_y :
			begin
				r_scale_y <= DataIn;
			end	
			
		endcase
	end
end

localparam m_read = 1'b1;

/* instansing module */
PS2MouseInterfaceAdapter ps2ia
(
	.Clk(Clk),
	.Reset(Reset),
	
	.PS2Clk(PS2Clk),
	.PS2Data(PS2Data),
	
	.BtLeft(m_btLeft),
	.BtRight(m_btRight),
	.BtMiddle(m_btMiddle),
	
	.XIncrement(m_x_increment),
	.YIncrement(m_y_increment),
	
	.DataReady(m_data_ready),
	.Read(m_read),           
	.ErrorNoAck(ENoAck)
);


endmodule
