`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 15:47:37
// Design Name: 
// Module Name: pcMUX
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


(* keep_hierarchy = "yes" *) module pcMUX(
    input wire [31:0] pc_plus4,pc_plusImm,jalr_adrs,
    input wire jalr,pcSrc,jump,
    output reg [31:0] instruction_adrs 
    );
    
initial instruction_adrs = 0;

 always@* begin
    instruction_adrs = 32'h00000000;
     if( !pcSrc && !jalr && !jump) begin
        instruction_adrs = pc_plus4;
     end else if( (pcSrc | jump) && !jalr ) begin
        instruction_adrs = pc_plusImm;
        end else if( !pcSrc && jalr && !jump) begin
            instruction_adrs = jalr_adrs;
           end
     end
endmodule
