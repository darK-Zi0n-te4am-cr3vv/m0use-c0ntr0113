/* ControllerTopmodule.v */

`timescale 1ns / 1ps

module ControllerTopmodule
(
	input wire CLK_50MHZ,
	input wire BTN_WEST, /* reset button */
	
	inout wire PS2_CLK,
	inout wire PS2_DATA,
	
	output wire [7:0] LED,
	
	output wire VGA_R,
	output wire VGA_G,
	output wire VGA_B,
	
	output wire VGA_HS,
	output wire VGA_VS
);

wire reset = BTN_WEST;
wire clk = CLK_50MHZ;


wire [31:0] m_state;
wire [2:0] m_rgb;

assign m_rgb[0] = m_state[3];
assign m_rgb[1] = m_state[4];
assign m_rgb[2] = m_state[0];

wire 
	m_pixel_tick,
	m_vga_on
;

wire [9:0]
	m_pixel_x,
	m_pixel_y
;

MasterSlave mc
(
	.Clk(clk),
	.Reset(reset),
	.PS2Clk(PS2_CLK),
	.PS2Data(PS2_DATA),
	.MouseState(m_state)
);

VGAOut vgaout
(
	.Clk(clk),
	.Reset(reset),
	
	.PixelTick(m_pixel_tick),
	.VgaOn(m_vga_on),
	.PixelX(m_pixel_x),
	.PixelY(m_pixel_y),
	
	.RGB(m_rgb),
	
	.VGA_R(VGA_R),
	.VGA_G(VGA_G),
	.VGA_B(VGA_B),
	
	.VGA_HS(VGA_HS),
	.VGA_VS(VGA_VS)
);



endmodule

