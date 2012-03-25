`timescale 1ns / 1ps

module Clk
(
	output reg Clk
);

initial begin
	Clk = 0;
	forever #10 Clk =~ Clk;
end


endmodule
