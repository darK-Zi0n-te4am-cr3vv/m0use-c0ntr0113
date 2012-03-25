`timescale 1ns / 1ps

/*
	PS2 rx/tx module
	(c) C.c, DZTC 2012
*/

module PS2
(
	input wire Clk,
	input wire Reset,
	
	input wire Write,
	
	input wire [7:0] TxData,
	output wire [7:0] RxData,
	
	output wire RxDone,
	output wire TxDone,
	
	inout wire PS2Clk,
	inout wire PS2Data
	
);

wire tx_idle;

PS2Tx tx
(
	.Clk(Clk),
	.Reset(Reset),
	.Data(TxData),
	.Write(Write),
	.Done(TxDone),
	.PS2Clk(PS2Clk),
	.PS2Data(PS2Data),
	.Idle(tx_idle)
	
);

PS2Rx rx
(
	.Clk(Clk),
	.Reset(Reset),
	.Data(RxData),
	.Done(RxDone),
	.PS2Clk(PS2Clk),
	.PS2Data(PS2Data),
	.RxEnable(tx_idle)
);

endmodule
