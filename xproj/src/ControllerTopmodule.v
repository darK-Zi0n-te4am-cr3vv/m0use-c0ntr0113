`timescale 1ns / 1ps

module ControllerTopmodule
(
	input wire CLK_50MHZ,
	input wire BTN_WEST, /* reset button */
	
	inout wire PS2_CLK,
	inout wire PS2_DATA,
	
	output wire [7:0] LED,
	input wire [3:0] SW 
);

wire reset;
assign reset = BTN_WEST;

wire [7:0] addr_i;
assign addr_i[3:0] = SW[3:0];
assign addr_i[7:4] = 4'b0000;

wire rd_i = 1;
wire wr_i = 0;

MouseController mc
(
	.Clk(CLK_50MHZ),
	.Reset(reset),
	.Addr(addr_i),
	.PS2Clk(PS2_CLK),
	.PS2Data(PS2_DATA),
	.RD(rd_i),
	.WR(wr_i),
	.Data(LED)
);


endmodule
