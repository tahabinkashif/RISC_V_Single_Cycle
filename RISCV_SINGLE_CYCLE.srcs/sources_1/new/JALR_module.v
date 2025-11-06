`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 15:44:22
// Design Name: 
// Module Name: JALR_module
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


(* keep_hierarchy = "yes" *) module JALR_module(
    input wire jalr,
    input wire [31:0] aluResult,
    output reg [31:0] aluResult_LSB0
    );
    
   initial aluResult_LSB0 = 0;    
    
   always@* begin
   aluResult_LSB0 = 32'h00000000;
   if(jalr) begin
        aluResult_LSB0 = aluResult & 32'hFFFFFFFE;
   end
   end
endmodule
