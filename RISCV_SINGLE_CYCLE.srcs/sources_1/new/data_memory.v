`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 16:20:10
// Design Name: 
// Module Name: data_memory
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


 (* keep_hierarchy = "yes" *)module data_memory(
    input wire clk,memWrite,
    input wire [31:0] write_data,
    input wire [31:0] read_write_adrs,
    output wire [31:0] read_data,
    output wire [31:0] reg1,reg2
    );
  reg [31:0] memory[0:10]; 
  
  initial begin
   memory[2] = 32'h00000000A;
   memory[1] = 32'h00000000C;
   memory[3] = 32'b0;
  end
  
 assign reg1 = memory[3];
 assign reg2 = memory[4];
 
  /*always@* begin
   read_data = 32'h00000000;
   if(!memWrite) begin
     read_data = memory[read_write_adrs];
     end
  end*/
  assign read_data = (!memWrite) ? memory[read_write_adrs] : 32'h0;
  
  always@(posedge clk) begin
  if(memWrite) begin
    memory[read_write_adrs] <= write_data;
    end else begin
        memory[read_write_adrs] <=  memory[read_write_adrs];
    end
  end
endmodule



