`timescale 1ns / 1ps
`include "global.inc"

module PS2ControllerAmba
#(
    parameter
        ADDR_WIDTH = 8,
        DATA_WIDTH = 32
)
(

// Global signals
    input wire ACLK,
    input wire ARESETn,
	
// Write address channel signals
    input wire [ADDR_WIDTH-1:0] AWADDR,
    input wire [2:0] AWPROT,
    input wire AWVALID,
    
    output reg AWREADY,
    
// Write data channel
    input wire [DATA_WIDTH-1:0] WDATA,
    input wire [DATA_WIDTH/8 - 1 :0] WSTRB,
    input wire WVALID,
    
    output reg WREADY,
    
// Write response channel signals
    input wire BREADY,
    
    output reg [1:0] BRESP,
    output reg BVALID,
    
// Read address channel signals
    input wire [ADDR_WIDTH-1:0] ARADDR,
    input wire [2:0] ARPROT,
    input wire ARVALID,
    
    output reg ARREADY,

// Read data channel signals
    input wire RREADY,
    
    output reg [DATA_WIDTH-1:0] RDATA,
    output reg [1:0] RRESP,
    output reg RVALID,
	 
	 /* ps2 signals */
	 inout wire PS2Clk,
	 inout wire PS2Data
);

wire [31:0]
	data_out,
	data_in
;

wire
	e_no_read_reg,
	e_no_write_reg,
	e_no_ack
;


// Write FSM
    wire reset = ~ARESETn;
    
    reg AWREADY_next, WREADY_next;
    reg [1:0] BRESP_next;
    reg BVALID_next;
   
	 reg write_data;
	
    reg [1:0] wstate, wstate_next;
    
    localparam
        RESET = 0,
        READY = 1,
        VALID = 2,
        RESP = 3;
   
    always@(posedge reset, posedge ACLK)
        if(reset)
            begin
                BVALID <= 0;
                wstate <= RESET;
            end
        else
            begin
                AWREADY <= AWREADY_next;
                
                WREADY  <= WREADY_next;
               
                BRESP   <= BRESP_next;
                BVALID  <= BVALID_next;

                wstate  <= wstate_next;
            end
            
     always@*
        begin
            AWREADY_next = AWREADY;
            WREADY_next = WREADY;
            BRESP_next = BRESP;
            BVALID_next = BVALID;
            
            wstate_next = wstate;
				write_data = 1'b0;
            
            case(wstate)
                RESET: wstate_next = READY;
                READY:
                    begin
                        AWREADY_next = 1;
                        WREADY_next = 1;
                        
                        wstate_next = VALID;
                    end
                VALID:if(AWVALID & WVALID)
                    begin
                        if(e_no_ack || e_no_write_reg)
                            BRESP_next = `RESP_SLVERR;
                        else
                            begin
                                write_data = 1'b1;
                                BRESP_next = `RESP_OKAY;
                            end
                             
                        BVALID_next = 1;
                        AWREADY_next = 0;
                        WREADY_next = 0;
                          
                        wstate_next = RESP;
                    end
                RESP: if(BREADY)
                    begin
                        BVALID_next = 0;
                        wstate_next = READY;
                    end
            endcase
        end
        
// Read FSM
    reg ARREADY_next;
    reg [DATA_WIDTH-1:0] RDATA_next;
    reg [1:0] RRESP_next;
    reg RVALID_next;
    
    reg [1:0] rstate, rstate_next;
    
    always@(posedge reset, posedge ACLK)
        if(reset)
            begin
                RVALID <= 0;
                rstate <= RESET;
            end
        else
            begin
                ARREADY <= ARREADY_next;
                RDATA   <= RDATA_next;
                RRESP   <= RRESP_next;
                RVALID  <= RVALID_next;
                
                rstate  <= rstate_next;
            end
            
    always@(rstate, ARVALID, RREADY, ARADDR)
        begin
            ARREADY_next = AWREADY;
            RDATA_next = RDATA;
            RRESP_next = RRESP;
            RVALID_next = RVALID;
            
            case(rstate)
                RESET: rstate_next = READY;
                READY: begin
                        ARREADY_next = 1;
                        rstate_next = VALID;
                   end
                VALID: if(ARVALID)
                    begin
                        ARREADY_next = 0;
                        RVALID_next = 1;
                        rstate_next = RESP;
                                
                        if(e_no_ack || e_no_read_reg)
                            RRESP_next = `RESP_SLVERR;
                        else
                            begin
                                RDATA_next = data_out;
                                RRESP_next = `RESP_OKAY;
                            end
                    end
                RESP: if(RREADY)
                    begin
                        RVALID_next = 0;
                        rstate_next = READY;
                    end
            endcase
        end


PS2MouseRegisters ps2r
(
	.Clk(ACLK),
	.Reset(~ARESETn),
	
	.PS2Clk(PS2Clk),
	.PS2Data(PS2Data),
	
	.ReadAddress(ARADDR),
	.WriteAddress(AWADDR),
	
	.DataOut(data_out),
	.DataIn(WDATA),
	
	.WriteData(write_data),
	
	.ENoReadReg(e_no_read_reg),
	.ENoWriteReg(e_no_write_reg),
	
	.ENoAck(e_no_ack)
	
);

endmodule
