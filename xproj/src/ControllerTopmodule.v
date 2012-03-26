`timescale 1ns / 1ps

module ControllerTopmodule
(
	input wire CLK_50MHZ,
	input wire BTN_WEST, /* reset button */
	
	inout wire PS2_CLK,
	inout wire PS2_DATA,
	
	output wire [7:0] LED
);

wire reset;
assign reset = BTN_WEST;

PS2Test ps2
(
	.Clk(CLK_50MHZ),
	.Reset(reset),
	.PS2Clk(PS2_CLK),
	.PS2Data(PS2_DATA),
	.Q(LED)
);

endmodule
