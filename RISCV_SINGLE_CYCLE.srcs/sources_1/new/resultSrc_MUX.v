`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 16:34:27
// Design Name: 
// Module Name: resultSrc_MUX
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


(* keep_hierarchy = "yes" *) module resultSrc_MUX(
    input wire [1:0] resultSrc,
    input wire AUIPC_Src,
    input wire [31:0] aluResult,readData,pc_plus4,pc_plusImm,ImmExt,
    output reg [31:0] resultW
    );
    
 initial resultW = 0;   
    
    
always@* begin 
  case(resultSrc)
     2'b00: begin
         resultW = aluResult;
     end
     2'b01: begin
         resultW = readData;
     end
     2'b10: begin
         resultW = pc_plus4;
     end
     2'b11: begin
          if(AUIPC_Src) begin
            resultW = pc_plusImm;
          end
          else if(!AUIPC_Src) begin
            resultW  = ImmExt;
           end
     end    
     endcase
  end
endmodule










