`timescale 1ns / 1ps

module PS2OpencoresTest
(	
	input wire Clk, 
	input wire Reset,
	
	inout wire PS2Clk,
	inout wire PS2Data,
	
	output wire [7:0] Q
);


// register declarations
	wire LeftButton;
	wire RightButton;
	wire [8:0] XMovement;
	wire [8:0] YMovement;
	
	// Instantiate the module
	ps2_mouse_interface mouse 
	(
		.clk(Clk), 
		.reset(Reset),
		.ps2_clk(PS2Clk), 
		.ps2_data(PS2Data), 
		.left_button(LeftButton), 
		.right_button(RightButton), 
		.x_increment(XMovement), 
		.y_increment(YMovement)
	);

	
	assign Q[0] = RightButton;
	assign Q[1] = LeftButton;
	
	assign Q[2] = XMovement[0];
	assign Q[3] = XMovement[1];
	assign Q[4] = XMovement[2];
	
	assign Q[5] = YMovement[0];
	assign Q[6] = YMovement[1];
	assign Q[7] = YMovement[2];

endmodule
