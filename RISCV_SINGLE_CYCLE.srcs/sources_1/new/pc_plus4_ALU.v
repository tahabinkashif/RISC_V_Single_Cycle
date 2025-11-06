`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 16:56:02
// Design Name: 
// Module Name: pc_plus4_ALU
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


(* keep_hierarchy = "yes" *) module pc_plus4_ALU(
    input wire [31:0] pc_adrs,
    output wire  [31:0] pc_plus4
    );
   
       
   assign pc_plus4 = (pc_adrs <= 7'd36) ? pc_adrs + 3'd4 : 3'd0;
 
 
endmodule
