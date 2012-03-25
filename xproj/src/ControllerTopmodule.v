`timescale 1ns / 1ps

module ControllerTopmodule
(
	input wire CLK_50MHZ,
	input wire BTN_WEST, /* reset button */
	
	inout wire PS2_CLK,
	inout wire PS2_DATA,
	
	output reg [7:0] LED
);

wire reset;
assign reset = BTN_WEST;

/* just playing with LED's to make sure that map is ok */

reg [15:0] c_counter;

always @(posedge CLK_50MHZ, posedge reset)
begin
	if (reset)
	begin
		c_counter <= 0;
		LED <= 8'hEA;
	end
	
	else begin 
		c_counter <= c_counter - 1;
	
		if (c_counter == 0)
		begin
			c_counter <= 50000;
			LED <= (LED << 1) + LED[7];
		end
	end
end

endmodule
