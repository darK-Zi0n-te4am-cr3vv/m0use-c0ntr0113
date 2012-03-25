`timescale 1ns / 1ps

/*
	PS/2 Tx bit start/parity/stop bit logic
	(c) C.c, DZTC 2012
*/

module PS2TxByteParity
(
	input wire [7:0] Data,
	output wire [10:0] Q
);


// 1pdddddddd0

assign Q[0] = 0; 
assign Q[8:1] = Data;
assign Q[9] = ~^Data;
assign Q[10] = 1; 

endmodule
