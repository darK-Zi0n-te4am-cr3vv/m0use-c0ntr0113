/* ControllerTopmodule.v */

`timescale 1ns / 1ps

module ControllerTopmodule
(
	input wire CLK_50MHZ,
	input wire BTN_WEST, /* reset button */
	
	inout wire PS2_CLK,
	inout wire PS2_DATA,
	
	output wire [7:0] LED,
	
	output wire [3:0] VGA_R,
	output wire [3:0] VGA_G,
	output wire [3:0] VGA_B,
	
	output wire VGA_HS,
	output wire VGA_VS
);

wire reset = BTN_WEST;
wire clk = CLK_50MHZ;


wire [31:0] m_state;
wire [11:0] m_rgb = {{4{m_state[2]}}, {4{m_state[1]}}, {4{m_state[0]}}};

wire 
	m_pixel_tick,
	m_vga_on
;

wire [9:0]
	m_pixel_x,
	m_pixel_y
;


reg [23:0] clkc;

always @(posedge clk)
begin
	clkc <= clkc + 1;
end 

assign LED[7:0] = m_state[7:0];

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
	.VideoOn(m_vga_on),
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

