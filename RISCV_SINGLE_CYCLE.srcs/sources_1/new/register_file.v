`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 12:41:25
// Design Name: 
// Module Name: register_file
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


(* keep_hierarchy = "yes" *) module register_file(
    input wire WE,clk,rst,
    input wire [4:0] read_adrs1,read_adrs2,write_adrs,
    input wire [31:0] write_data,
    output wire [31:0] read_data1,read_data2    //,reg1,reg2,reg3
    );
    
    integer i;
    reg [31:0] reg_file[0:10];
    assign read_data1 = reg_file[read_adrs1];
    assign read_data2 = reg_file[read_adrs2];
    
    
   /* initial begin
    for (i = 0; i < 32; i = i + 1) begin
                    reg_file[i] = 32'b0;
                end
    end*/
    
 /* assign reg1 = reg_file[5];
   assign reg2 = reg_file[6];
   assign reg3 = reg_file[7];*/
 
    
    always@(posedge clk) begin
    if(rst) begin
            for (i = 0; i < 10; i = i + 1) begin
                reg_file[i] <= 32'b0;
            end
        end else if(WE && (write_adrs != 0)) begin
           reg_file[write_adrs] <= write_data;
        end else begin
            reg_file[0] = 32'b0;
            end
    end      
endmodule
