`timescale 1ns / 1ps

module ClkBench;

	// Outputs
	wire Clk;

	// Instantiate the Unit Under Test (UUT)
	Clk uut (
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

