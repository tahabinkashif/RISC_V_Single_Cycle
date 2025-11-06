`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2025 23:06:59
// Design Name: 
// Module Name: program_counter
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


(* keep_hierarchy = "yes" *) module program_counter( //#(parameter BASE_ADDRESS = 32'h00000000)(
    input wire clk,rst,
    input wire [31:0] inputAddress,
    output reg [31:0] outputAddress 
    );
    
    //initial outputAddress = 0;
    
    always@(posedge clk) begin
    if(rst) begin
        outputAddress <= 32'h00000000;
    end else if(inputAddress < 7'd41) begin
        outputAddress <= inputAddress;
        end else begin
           outputAddress <= 32'b0;
        end
    end
endmodule
