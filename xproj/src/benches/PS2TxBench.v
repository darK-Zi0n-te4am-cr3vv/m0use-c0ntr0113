`timescale 1ns / 1ps

module PS2TxBench;

	// Inputs
	wire Clk;
	reg Reset;
	reg Write;
	reg [7:0] Data;

	wire [7:0] State;

	// Outputs
	wire Done;
	wire Idle;

	// Bidirs
	wire PS2Clk;
	wire PS2Data;
	
	Clk clk
	(
		.Clk(Clk)
	);

	// Instantiate the Unit Under Test (UUT)
	PS2Tx uut 
	(
		.PS2Clk(PS2Clk), 
		.PS2Data(PS2Data), 
		.Clk(Clk), 
		.Reset(Reset), 
		.Write(Write), 
		.Data(Data), 
		.Done(Done), 
		.Idle(Idle),
		.State(State)
	);

	reg ps2c_z, ps2c_out;
	
	assign PS2Clk = ps2c_z ? 1'bZ : ps2c_out;

	pullup(PS2Clk);
	pullup(PS2Data);
	

	initial begin
		Reset = 0;
		Write = 0;
		Data = 8'hF4;
		ps2c_z <= 1'b1;
		ps2c_out <= 1'b1;


		#10;
        
		Reset = 1'b1;
		#20 Reset = 1'b0;
			
		#100
			
		Write = 1'b1;
		#20 Write = 1'b0;
		
		#110000 
		ps2c_z <= 1'b0;
		ps2c_out <= 1'b1;
		
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		#50000 ps2c_out <=~ ps2c_out;
		
		

	end
      
endmodule
