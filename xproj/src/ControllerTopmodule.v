`timescale 1ns / 1ps

module ControllerTopmodule
(
	input wire CLK_50MHZ,
	input wire BTN_WEST, /* reset button */
	
	inout wire PS2_CLK,
	inout wire PS2_DATA,
	
	output wire [7:0] LED
);

wire reset;
assign reset = BTN_WEST;

// register declarations
	wire LeftButton;
	wire RightButton;
	wire [8:0] XMovement;
	wire [8:0] YMovement;
	
	// Instantiate the module
	ps2_mouse_interface mouse 
	(
		.clk(CLK_50MHZ), 
		.reset(reset),
		.ps2_clk(PS2_CLK), 
		.ps2_data(PS2_DATA), 
		.left_button(LeftButton), 
		.right_button(RightButton), 
		.x_increment(XMovement), 
		.y_increment(YMovement)
	);

	
	assign LED[0] = RightButton;
	assign LED[1] = LeftButton;
	
	assign LED[2] = XMovement[0];
	assign LED[3] = XMovement[1];
	assign LED[4] = XMovement[2];
	
	assign LED[5] = YMovement[0];
	assign LED[6] = YMovement[1];
	assign LED[7] = YMovement[2];

endmodule
