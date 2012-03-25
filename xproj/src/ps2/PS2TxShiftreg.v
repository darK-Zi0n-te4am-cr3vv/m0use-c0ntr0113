`timescale 1ns / 1ps

module PS2TxShiftreg
(
	input wire Write,
	input wire [10:0] Data,
	input wire ShiftClk,
	input wire ShiftEn,
	
	output wire Done,
	output wire Q
);

reg [10:0] _data; 
reg [3:0] b_shift;

always @(posedge ShiftClk)
begin
	if (ShiftEn & !Done)
	begin
		b_shift = b_shift + 1;
	end
end


always @(posedge Write)
begin
	_data = Data;
	b_shift = 0;
end

initial begin
	_data <= 0;
	b_shift <= 0;
end

assign Q = _data >> b_shift;
assign Done = b_shift == 11;

endmodule
