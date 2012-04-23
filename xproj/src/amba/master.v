`timescale 1ns / 1ps

`include "global.inc"

module master
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
    
    output reg RREADY
);

    localparam MEM_LEN = 7;

    reg [DATA_WIDTH-1:0] wmem[0:MEM_LEN];
    reg [DATA_WIDTH-1:0] rmem[0:MEM_LEN];
    
    integer i;
    reg [DATA_WIDTH-1:0] data_buf;
    initial begin
        for(i = 0; i <= MEM_LEN; i = i+1)
            begin
                data_buf = 1823;
                wmem[i] = data_buf[7:0];
                rmem[i] = 0;
            end
    end

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

    always@(posedge reset, posedge ACLK)
        if(reset)
            begin
                AWVALID <= 0;
                WVALID <= 0;
                AWADDR <= -1;
                wstate <= RESET;
            end
        else
            begin
                AWADDR  <= AWADDR_next;
                AWPROT  <= AWPROT_next;
                AWVALID <= AWVALID_next;
                
                WDATA   <= WDATA_next;
                WSTRB   <= WSTRB_next;
                WVALID  <= WVALID_next;
    
                BREADY  <= BREADY_next;
                
                wstate  <= wstate_next;
            end

    always@(wstate, BVALID, AWREADY, WREADY, BRESP)
        begin
            AWADDR_next = AWADDR;
            AWPROT_next = AWPROT;
            AWVALID_next = AWVALID;
                
            WDATA_next = WDATA;
            WSTRB_next = WSTRB;
            WVALID_next = WVALID;
    
            BREADY_next = BREADY;
            
            wstate_next = wstate;
            
            case(wstate)
                RESET: wstate_next = VALID;
                VALID: begin
                        AWVALID_next = 1;
                        AWADDR_next = (AWADDR == MEM_LEN)? 0: AWADDR + 1;
                        AWPROT_next = 3'b010;                  
                        
                        WVALID_next = 1;
                        WDATA_next = wmem[AWADDR_next];
                        
                        // all data accesses use the  full width of the data bus
                        WSTRB_next = {(DATA_WIDTH/8){1'b1}}; 
                        
                        BREADY_next = 1;
                        
                        wstate_next = READY;
                    end
                READY: if(AWREADY & WREADY)
                    begin
                        WVALID_next = 0;
                        AWVALID_next = 0;
                        
                        wstate_next = RESP;
                    end             
                RESP: if(BVALID)
                    begin
                        // обрабатываем ответ 
                        BREADY_next = 0;
                        wstate_next = VALID;
                    end
            endcase
        end
    
// Read FSM

    reg [ADDR_WIDTH-1:0] ARADDR_next;
    reg [2:0] ARPROT_next;
    reg ARVALID_next, RREADY_next;
    
    reg [1:0] rstate, rstate_next;

    always@(posedge reset, posedge ACLK)
        if(reset)
            begin
                ARVALID <= 0;
                ARADDR  <= -2;
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
                        ARADDR_next = (ARADDR == MEM_LEN)? 0: ARADDR + 1;
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
                        if(RRESP == `RESP_OKAY)
                            rmem[ARADDR] = RDATA;
                        RREADY_next = 0;
                        rstate_next = VALID;
                    end
            endcase
        end

endmodule
