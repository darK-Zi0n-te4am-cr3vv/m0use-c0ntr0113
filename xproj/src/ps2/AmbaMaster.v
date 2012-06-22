`timescale 1ns / 1ps

`include "global.inc"

module AmbaMaster
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
    input wire AWREADY,

    output reg [ADDR_WIDTH-1:0] AWADDR,
    output reg [2:0] AWPROT,
    output reg AWVALID,
    
// Write data channel
    input wire WREADY,
    
    output reg [DATA_WIDTH-1:0] WDATA,
    output reg [DATA_WIDTH/8 - 1 :0] WSTRB,
    output reg WVALID,
    
// Write response channel signals
    input wire [1:0] BRESP,
    input wire BVALID,
    
    output reg BREADY,
    
// Read address channel signals
    input wire ARREADY,
    
    output reg [ADDR_WIDTH-1:0] ARADDR,
    output reg [2:0] ARPROT,
    output reg ARVALID,
    
// Read data channel signals
    input wire [DATA_WIDTH-1:0] RDATA,
    input wire [1:0] RRESP,
    input wire RVALID,
    
    output reg RREADY,
	 
	 output wire [31:0] MouseState
);

    
// Write FSM
    wire reset = ~ARESETn;

    reg [ADDR_WIDTH-1:0] AWADDR_next;
    reg [2:0] AWPROT_next;
    reg [DATA_WIDTH-1:0] WDATA_next;
    reg [DATA_WIDTH/8 - 1 :0] WSTRB_next;
    reg WVALID_next, BREADY_next, AWVALID_next;
    
    reg [1:0] wstate, wstate_next;


    
    localparam
        RESET = 0,
        VALID = 1,
        READY = 2,
        RESP = 3;

// Read FSM

    reg [ADDR_WIDTH-1:0] ARADDR_next;
    reg [2:0] ARPROT_next;
    reg ARVALID_next, RREADY_next;
    


    reg [1:0] rstate, rstate_next;

assign MouseState = RDATA;


    always@(posedge reset, posedge ACLK)
        if(reset)
            begin
                ARVALID <= 0;
                ARADDR  <= 0;
                rstate  <= RESET;
            end
        else
            begin
                ARADDR  <= ARADDR_next;
                ARPROT  <= ARPROT_next;
                ARVALID <= ARVALID_next;
                RREADY  <= RREADY_next;
                
                rstate  <= rstate_next;
            end
            
     always@*
        begin
            ARADDR_next = ARADDR;
            ARPROT_next = ARPROT;
            ARVALID_next = ARVALID;
            RREADY_next = RREADY;
            
            case(rstate)
                RESET: rstate_next = VALID;
                VALID: begin
                        ARVALID_next = 1;
                        ARADDR_next = 8'h02; // STATE
                        ARPROT_next = 3'b010;
                        
                        RREADY_next = 1;
                        
                        rstate_next = READY;
                    end
                READY: if(ARREADY)
                    begin
                        ARVALID_next = 0;
                        rstate_next = RESP;
                    end
                RESP: if(RVALID)
                    begin
                        
								// add read code
								
								//MouseState <= RDATA;
								
                        RREADY_next = 0;
                        rstate_next = VALID;
                    end
            endcase
        end

endmodule
