`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 22:41:10
// Design Name: 
// Module Name: Imm_Extension
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


(* keep_hierarchy = "yes" *) module Imm_Extension(
    input wire [31:7] instruction,
    input wire [2:0] immSrc,
    output reg [31:0] ImmExt
    );

initial ImmExt = 0;

always@* begin

  case(immSrc)
    3'b000: begin //I type & LOAD & JALR
           ImmExt = {{20{instruction[31]}}, instruction[31:20]};   
        end    
    3'b001: begin //store 
           ImmExt = {{20{instruction[31]}}, instruction[31:25],instruction[11:7]};   
        end    
    3'b010: begin //BRANCH
            ImmExt = {{19{instruction[31]}},instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};   
        end
        
    3'b011: begin // JAL
            ImmExt = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0}; 
        end    
                 
    3'b100: begin  //U type (LUI & AUIPC)
            ImmExt = {instruction[31:12], 12'b0};   //{instruction[31:12], 12'b0};  original LUI and AUIPC
        end
    3'b101: begin  //U type (LUI & AUIPC)
            ImmExt = {instruction[31:12], 12'b0};
        end
    default: ImmExt = 32'b0;
    endcase
end
endmodule
