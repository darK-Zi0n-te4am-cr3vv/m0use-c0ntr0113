module VGAOut
(
	input wire Clk,
	input wire Reset,
	
	/* pixel source */
	output wire VideoOn,
	output wire PixelTick,
	output wire [9:0] PixelX,
	output wire [9:0] PixelY,
	
	input wire [2:0] RGB,
	
	/* vga lines */
	output wire VGA_R,
	output wire VGA_G,
	output wire VGA_B,
	
	output wire VGA_HS,
	output wire VGA_VS
);

wire m_video_on;

assign VideoOn = m_video_on;

assign VGA_R = m_video_on ? RGB[2] : 1b'0;
assign VGA_G = m_video_on ? RGB[1] : 1b'0;
assign VGA_B = m_video_on ? RGB[0] : 1b'0;


VGASync sync
(
	.Clk(Clk),
	.Reset(Reset),
	
	.VideoOn(m_video_on),
	.PixelTick(PixelTick),
	.HorizontalSync(VGA_HS),
	.VerticalSync(VGA_VS),
	
	.PixelX(PixelX),
	.PixelY(PixelY)
);

endmodule

