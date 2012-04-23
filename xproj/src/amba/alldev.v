`timescale 1ns / 1ps

module alldev(
	input wire clk,
    input wire reset
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
    
    master #(
        .ADDR_WIDTH(ADDR_WIDTH), 
        .DATA_WIDTH(DATA_WIDTH))
    master_dev
    (
        .ACLK(clk), 
        .ARESETn(reset), 
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
        .RREADY(RREADY)
    );
    
    slave #(
        .ADDR_WIDTH(ADDR_WIDTH), 
        .DATA_WIDTH(DATA_WIDTH))
    slave_dev (
        .ACLK(clk), 
        .ARESETn(reset), 
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
        .RREADY(RREADY)
    );


endmodule
