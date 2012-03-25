`timescale 1ns / 1ps

/*
	Simple timer for PS/2
	(c) C.c 2012
*/

module Timer
(
	input Clk,
	input Start,
	input [15:0] Interval,
	output Done
);

reg running, _done;
reg [15:0] ticks;

assign Done = _done;

always @(posedge Start or posedge Clk)
begin 
	if (Start)
		begin
			running <= 1'b1;
			ticks <= Interval;
		end
		
	else if (Clk)
		begin
			_done = 1'b0;

			if (running) 
			begin
				ticks <= ticks - 1;
				if (ticks == 1) 
				begin
					_done = 1'b1;
					running <= 1'b0;
				end
			end
		end
end


initial begin
	ticks <= 16'hFF;
	running <= 1'b0;
	_done <= 1'b0;
end

endmodule
