`timescale 1ns / 1ps

/*
	wrapper for ps2_mouse_interface
	(c) C.c, DZTC 2012
*/

module MouseController
(
	input wire Clk,
	input wire Reset,
	
	input wire [7:0] Addr,
	inout wire [31:0] Data,
	input wire RD,
	input wire WR,
	
	inout wire PS2Clk,
	inout wire PS2Data
);

/* register addreses */

localparam [7:0]
	a_pos_x   = 8'h00,
	a_pos_y   = 8'h01,
	a_state   = 8'h02,
	a_scale_x = 8'h03,
	a_scale_y = 8'h04;
	

wire write_i = Clk & WR;
wire read_i = Clk & RD;

/* Data */
wire [31:0] data_i;
assign Data = RD ? data_i : 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ; 

/* addresses */

wire ad_pos_x = Addr == a_pos_x;
wire ad_pos_y = Addr == a_pos_y;
wire ad_state = Addr == a_state;
wire ad_scale_x = Addr == a_scale_x;
wire ad_scale_y = Addr == a_scale_y;

/* read events */

wire r_pos_x   = read_i & ad_pos_x;
wire r_pos_y   = read_i & ad_pos_y;
wire r_state   = read_i & ad_state;
wire r_scale_x = read_i & ad_scale_x;
wire r_scale_y = read_i & ad_scale_y;

/* write events */

wire w_pos_x   = write_i & ad_pos_x;
wire w_pos_y   = write_i & ad_pos_y;
wire w_state   = write_i & ad_state;
wire w_scale_x = write_i & ad_scale_x;
wire w_scale_y = write_i & ad_scale_y;


/* mouse wires */

wire m_left_button, m_right_button, m_middle_button;
wire [8:0] m_x_increment, m_y_increment;
wire m_data_ready;
wire data_ready = m_data_ready & !write_i;

//reg m_read;

/* m_status */

wire [31:0] m_status;

assign m_status[0] = m_left_button;
assign m_status[1] = m_right_button;
assign m_status[2] = m_middle_button;
assign m_status[3] = m_x_increment[8];
assign m_status[4] = m_y_increment[8];
assign m_status[31:6] = 0;


/* pos_x / pos_y */
reg [31:0] pos_x, pos_y;

/* scale */
reg [7:0] scale_x, scale_y;
wire [31:0] x_increment = {{23{m_x_increment[8]}},m_x_increment} << scale_x;
wire [31:0] y_increment = {{23{m_y_increment[8]}},m_y_increment} << scale_y;

/* reading assigments */
assign data_i = r_pos_x   ? pos_x :
                r_pos_y   ? pos_y :
				r_state   ? m_status :
				r_scale_x ? scale_x :
				r_scale_y ? scale_y : 
	
				32'h00000000
;
					 

wire [7:0] data_8 = Data[7:0];
always @(posedge Reset, 
			posedge write_i, 
			posedge data_ready)
begin
	if (Reset)
	begin
		scale_x <= 8'h00;
		scale_y <= 8'h00;
		
		pos_x <= 32'h00000000;
		pos_y <= 32'h00000000;
		
		//m_read <= 1'b1;
	end
	
	else if (write_i)
	begin
		if (w_pos_x) pos_x <= Data;
		if (w_pos_y) pos_y <= Data;
		if (w_scale_x) scale_x <= data_8;
		if (w_scale_y) scale_y <= data_8;
	end
	
	else if (data_ready)
	begin
		pos_x <= pos_x + x_increment;
		pos_y <= pos_y + y_increment;
	
		//m_read <= 1'b1;
	end
end

localparam m_read = 1;

ps2_mouse_interface ps2
(
	.clk(Clk), 
	.reset(Reset),
	.ps2_clk(PS2Clk), 
	.ps2_data(PS2Data), 
	
	.left_button(m_left_button), 
	.right_button(m_right_button),
	.middle_button(m_middle_button),
	.x_increment(m_x_increment), 
	.y_increment(m_y_increment),
	.data_ready(m_data_ready),
	.read(m_read)
	//.read(m_read)
);

endmodule
