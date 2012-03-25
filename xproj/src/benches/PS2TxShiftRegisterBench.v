`timescale 1ns / 1ps

module PS2TxShiftRegisterBench;

	// Inputs
	reg Write;
	reg [10:0] Data;
	reg ShiftClk;
	reg ShiftEn;

	// Outputs
	wire Done;
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	PS2TxShiftreg uut (
		.Write(Write), 
		.Data(Data), 
		.ShiftClk(ShiftClk), 
		.ShiftEn(ShiftEn), 
		.Done(Done), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		Write = 0;
		Data = 0;
		ShiftClk = 0;
		ShiftEn = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		Data = 11'h7AE;
		
		Write = 1'b1;
		#10 Write = 1'b0;
		
		forever #1000 ShiftClk = ~ShiftClk;
		
		
        
		// Add stimulus here

	end
      
endmodule

