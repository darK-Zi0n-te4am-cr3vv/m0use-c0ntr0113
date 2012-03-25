module PS2Test
(
	input wire Clk,
	input wire Reset,
	
	inout wire PS2Clk,
	inout wire PS2Data,
	
	output reg [7:0] Q
);

wire tx_done, rx_done;
wire [7:0] rx_data;

reg wr_ps2;
reg [7:0] tx_data;

PS2 ps2 
(
	.Clk(Clk),
	.Reset(Reset),
	
	.Write(wr_ps2),
	
	.RxData(rx_data), 
	.TxData(tx_data),
	
	.TxDone(tx_done),
	.RxDone(rx_done),
	
	.PS2Clk(PS2Clk),
	.PS2Data(PS2Data)
);

always @(posedge rx_done)
begin
	Q <= rx_data;
end

reg [2:0] c_state, n_state;

always @(posedge Clk, posedge Reset)
begin
	if (Reset)
	begin
		c_state <= 3'b001;
	end
	
	else c_state <= n_state;
end

always @*
begin
	n_state = c_state;
	wr_ps2 = 1'b0;
	
	case (c_state)
		3'b001: begin
			tx_data = 8'hF4; /* enable streaming mode */
			wr_ps2 = 1'b1;
			
			n_state = 3'b010;
		end
		
		3'b010: begin
			if (tx_done) n_state = 3'b000; /* idle */
		end
		
		3'b000: begin end
		
		
		
	endcase
end

endmodule
