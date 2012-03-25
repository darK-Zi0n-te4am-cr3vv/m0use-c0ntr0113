`timescale 1ns / 1ps


module PS2BpBench;

	// Inputs
	reg [7:0] Data;

	// Outputs
	wire [9:0] Q;

	// Instantiate the Unit Under Test (UUT)
	PS2TxByteParity uut (
		.Data(Data), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		Data = 8'h56;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

