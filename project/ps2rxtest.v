`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:48 08/04/2011 
// Design Name: 
// Module Name:    Mouse_Test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mouse_Test(
		input CLK_50MHZ,
		inout PS2_CLK,
		inout PS2_DATA,
		output [7:0] LED
    );
	
	
	
	reg ps2_reset;
	reg ps2_rx_en;
	
	wire data;
	reg led;
	wire rx_done;
	
	// Instantiate the module
	ps2_rx mouse (
		.clk(CLK_50MHZ),
		.reset(ps2_reset),	
		.rx_en(ps2_rx_en),
		.ps2c(PS2_CLK), 
		.ps2d(PS2_DATA),
		.dout(LED),
		.rx_done_tick(rx_done)
	);
	
	
initial begin	
    ps2_rx_en = 1;
	 //ps2_reset = 1;
	 //#10
	 //ps2_reset = 0; 
	 
end	


//always @(negedge PS2_CLK)
//begin
//	led <= led << 1;
//	led <= led + 1;
//end
	
//assign LED = led;
	
endmodule
