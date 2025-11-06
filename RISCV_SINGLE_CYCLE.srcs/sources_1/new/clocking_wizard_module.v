`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 23:44:49
// Design Name: 
// Module Name: clocking_wizard_module
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


module clocking_wizard_module(
     input wire rst1,locked,
     output reg rst
    );
    always@* begin
            if(rst1 || !locked) begin
               rst = 1'b1;
             end else begin
                        rst = 1'b0;
                  end  
       end  
endmodule
