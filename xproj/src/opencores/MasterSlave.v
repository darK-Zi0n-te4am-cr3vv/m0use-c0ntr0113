
module MasterSlave
(
	input wire Clk,
	input wire Reset,
	
	inout wire PS2Clk,
	inout wire PS2Data,
	
	output wire [31:0] MouseState
);

localparam
    ADDR_WIDTH = 8,
    DATA_WIDTH = 32;
    
    wire [ADDR_WIDTH-1:0] AWADDR, ARADDR; 
    wire [2:0] AWPROT, ARPROT; 
    wire AWVALID, WREADY; 
    wire [DATA_WIDTH-1:0] WDATA, RDATA; 
    wire [DATA_WIDTH/8 - 1 :0] WSTRB; 
    wire [1:0] BRESP, RRESP;
    wire BVALID, BREADY, ARREADY, ARVALID; 
    wire AWREADY, WVALID, RVALID, RREADY;     
    
    AmbaMaster #(
        .ADDR_WIDTH(ADDR_WIDTH), 
        .DATA_WIDTH(DATA_WIDTH))
    master_dev
    (
        .ACLK(Clk), 
        .ARESETn(~Reset), 
        .AWREADY(AWREADY), 
        .AWADDR(AWADDR), 
        .AWPROT(AWPROT), 
        .AWVALID(AWVALID), 
        .WREADY(WREADY), 
        .WDATA(WDATA), 
        .WSTRB(WSTRB), 
        .WVALID(WVALID), 
        .BRESP(BRESP), 
        .BVALID(BVALID), 
        .BREADY(BREADY), 
        .ARREADY(ARREADY), 
        .ARADDR(ARADDR), 
        .ARPROT(ARPROT), 
        .ARVALID(ARVALID), 
        .RDATA(RDATA), 
        .RRESP(RRESP), 
        .RVALID(RVALID), 
        .RREADY(RREADY),
		  
		  .MouseState(MouseState)
    );
    
    PS2ControllerAmba #(
        .ADDR_WIDTH(ADDR_WIDTH), 
        .DATA_WIDTH(DATA_WIDTH))
    slave_dev (
        .ACLK(Clk), 
        .ARESETn(~Reset), 
        .AWREADY(AWREADY), 
        .AWADDR(AWADDR), 
        .AWPROT(AWPROT), 
        .AWVALID(AWVALID), 
        .WREADY(WREADY), 
        .WDATA(WDATA), 
        .WSTRB(WSTRB), 
        .WVALID(WVALID), 
        .BRESP(BRESP), 
        .BVALID(BVALID), 
        .BREADY(BREADY), 
        .ARREADY(ARREADY), 
        .ARADDR(ARADDR), 
        .ARPROT(ARPROT), 
        .ARVALID(ARVALID), 
        .RDATA(RDATA), 
        .RRESP(RRESP), 
        .RVALID(RVALID), 
        .RREADY(RREADY),
		  
		  .PS2Clk(PS2Clk),
		  .PS2Data(PS2Data)
    );


endmodule
