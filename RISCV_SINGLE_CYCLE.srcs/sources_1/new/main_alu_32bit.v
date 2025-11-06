`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2025 18:55:01
// Design Name: 
// Module Name: main_alu_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


(* keep_hierarchy = "yes" *) module main_alu_32bit(
    input wire aluSrc,
    input wire [2:0] aluControl,
    input wire [31:0] srcA,RD2,ImmExt,
    output reg [31:0] aluResult,
    output reg V,C_or_B,N,Z
    );
    reg [32:0] temp;
    reg [31:0] srcB;
    
    initial begin
    aluResult = 0;
    temp = 0;
    srcB = 0;
    V = 0;
    C_or_B = 0;
    N = 0;
    Z = 0;
    end
    
    always@* begin
      if(!aluSrc) begin
        srcB = RD2;
     end
     else if(aluSrc) begin
        srcB = ImmExt;
     end
    end
    
    
   always@* begin
   aluResult = 3'b000;
   C_or_B = 1'b0;
   Z = 1'b0;
   V = 1'b0;
   N = 1'b0;
      
   
    case(aluControl)
        3'b000: begin
            temp = {1'b0,srcA} + {1'b0, srcB};
            aluResult = temp[31:0];
            C_or_B = temp[32];
            Z = (aluResult == 32'b0);
            V = (~(aluControl[0] ^ srcA[31] ^ srcB[31])) & (srcA[31] ^ aluResult[31]) & (~aluControl[1]); 
            N = aluResult[31];
            end
            
        3'b001: begin
             temp = {1'b0,srcA} + {1'b0, ~srcB} + 1'b1;
             aluResult = temp[31:0];
             C_or_B = ~temp[32];
             Z = (aluResult == 32'b0);
             V = (~(aluControl[0] ^ srcA[31] ^ srcB[31])) & (srcA[31] ^ aluResult[31]) & (~aluControl[1]); 
             N = aluResult[31];
            end
            
        3'b010: begin
              aluResult = srcA & srcB;
              C_or_B = 0;
              Z = (aluResult == 32'b0);
              V = 0; 
              N = aluResult[31];
            end
            
        3'b011: begin
              aluResult = srcA | srcB;
              C_or_B = 0;
              Z = (aluResult == 32'b0);
              V = 0; 
              N = aluResult[31];
            end
            
        3'b101: begin
              aluResult = ($signed(srcA) < $signed(srcB)) ? 32'hFFFFFFFF : 32'd0;
              C_or_B = 0;
              Z = (aluResult == 32'b0);
              V = 0; 
              N = aluResult[31];
           end
    endcase
   end
endmodule
