`timescale 1ns / 1ps

/* jusr a renamings */

module PS2MouseInterfaceAdapter
(
   /* common */
	input wire Clk,
	input wire Reset,

   /* ps2 signals */
	inout wire PS2Clk,
	inout wire PS2Data,
	
	/* read request */
	input wire Read,
	
	/* butttons */
	output wire BtLeft,
	output wire BtRight,
	output wire BtMiddle,
	
	/* increments */
	output wire [8:0] XIncrement,
	output wire [8:0] YIncrement,
	
	/* status wires */
	output wire DataReady,
	output wire ErrorNoAck
);


ps2_mouse_interface ps2
(
	.clk(Clk),
	.reset(Reset),
	.ps2_clk(PS2Clk),
	.ps2_data(PS2Data),
	
	.left_button(BtLeft),
	.right_button(BtRight),
	.middle_button(BtMiddle),
	
	.x_increment(XIncrement),
	.y_increment(YIncrement),
	
	.data_ready(DataReady),
	.read(Read),           
	.error_no_ack(ErrorNoAck)

);
	 


endmodule
