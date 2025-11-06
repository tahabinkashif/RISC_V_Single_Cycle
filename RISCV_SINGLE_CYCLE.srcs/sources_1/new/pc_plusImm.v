`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 17:02:39
// Design Name: 
// Module Name: pc_plusImm
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


(* keep_hierarchy = "yes" *) module pc_plusImm(
    input wire [31:0] ImmExt,pc_adrs,
    output wire [31:0] pc_plusImm
    );


 assign  pc_plusImm = (pc_adrs < 41) ?  ImmExt + pc_adrs : ImmExt;
endmodule
