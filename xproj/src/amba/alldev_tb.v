`timescale 1ns / 1ps

module alldev_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	alldev uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#20;
        
        reset = 1;
        
		// Add stimulus here
        
        forever #10 clk = ~clk;

	end
      
endmodule

