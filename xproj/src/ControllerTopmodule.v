/* ControllerTopmodule.v */

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

wire reset = BTN_WEST;

reg [23:0] clkc;
wire mckl = clkc[23];

//assign LED[0] = mckl;
//assign LED[7:1] = 7'h7f;

always @(posedge CLK_50MHZ)
begin
	clkc <= clkc + 1;
	
end



wire [31:0] mstate;

MasterSlave mc
(
	.Clk(CLK_50MHZ),
	.Reset(reset),
	.PS2Clk(PS2_CLK),
	.PS2Data(PS2_DATA),
	.MouseState(LED)
);

localparam [7:0] read_add = 8'h02;
localparam w_data = 1'b0;


//PS2MouseRegisters mc
//(
//	.Clk(CLK_50MHZ),
//	.Reset(reset),
//	.PS2Clk(PS2_CLK),
//	.PS2Data(PS2_DATA),
//
//	.ReadAddress(read_add),
//	.WriteAddress(read_add),
//	.WriteData(w_data),
//	
//	.DataOut(LED),
//	.DataIn(w_in)
//);



endmodule

