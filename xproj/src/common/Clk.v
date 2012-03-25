`timescale 1ns / 1ps

/*
	50 Mhz clock generator for benches
	(c) C.c, DZTC 2012
*/

module Clk
(
	output reg Clk
);

initial begin
	Clk = 0;
	forever #10 Clk =~ Clk;
end


endmodule
