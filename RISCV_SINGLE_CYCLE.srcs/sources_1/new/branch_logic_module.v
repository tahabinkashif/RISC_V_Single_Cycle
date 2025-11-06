`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 17:18:58
// Design Name: 
// Module Name: branch_logic_module
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


(* keep_hierarchy = "yes" *) module branch_logic_module(
    input wire branch,Z,V,N,C_or_B,
    input wire [2:0] funct3,
    output reg branchSrc
    );
    
    initial branchSrc = 0;
    
    always@* begin
    branchSrc = 1'b0;
        case(funct3)
                3'b000: begin
                    branchSrc = branch & Z;
                end
                3'b001: begin
                    branchSrc = branch & (~Z);
                end
                3'b100: begin
                    branchSrc = branch & (N^V);
                end
                3'b101: begin
                    branchSrc = branch & (~(N^V));
                end
                3'b110: begin
                    branchSrc = branch & (~C_or_B);
                end
                3'b111: begin
                    branchSrc = branch & C_or_B;
                end               
            endcase
    end
endmodule








