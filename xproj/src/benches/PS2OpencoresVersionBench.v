`timescale 1ns / 1ps

module PS2OpencoresVersionBench;

	// Inputs
	wire clk;
	reg reset;

	// Outputs
	wire left_button;
	wire right_button;
	wire [8:0] x_increment;
	wire [8:0] y_increment;
	wire data_ready;
	wire read;
	wire error_no_ack;

	// Bidirs
	wire ps2_clk;
	wire ps2_data;
	
	pullup (ps2_data);
	pullup (ps2_clk);
	

	// Instantiate the Unit Under Test (UUT)
	ps2_mouse_interface uut (
		.clk(clk), 
		.reset(reset), 
		.ps2_clk(ps2_clk), 
		.ps2_data(ps2_data), 
		.left_button(left_button), 
		.right_button(right_button), 
		.x_increment(x_increment), 
		.y_increment(y_increment), 
		.data_ready(data_ready), 
		.read(read), 
		.error_no_ack(error_no_ack)
	);

	Clk xclk(
		.Clk(clk)
	);

	reg ps2c_z, ps2c_out; 

	initial begin
		// Initialize Inputs
		reset = 0;
		ps2c_z = 1'b1;
		ps2c_out = 1'b0;
		
		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 1'b1;
		#20 reset = 1'b0;
      
		#400100
		ps2c_z = 1'b0;
		
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		#50000 ps2c_out = ~ps2c_out;
		
	end
      
assign ps2_clk = ps2c_z ? 1'bZ : ps2c_out;	
	
endmodule

