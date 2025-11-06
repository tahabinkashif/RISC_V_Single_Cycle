`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 16:01:39
// Design Name: 
// Module Name: alu_Control
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


(* DONT_TOUCH = "true" *) module alu_Control(

    input wire [2:0] funct3,
    input wire [1:0] aluOp,
    input wire funct7_bit5,
    output reg [2:0] aluControl
    );
    
initial aluControl = 3'b0;
 
always@* begin 
  
  if(aluOp == 2'b00) begin
        aluControl = 3'b000;
      end
    else if(aluOp == 2'b01) begin
        aluControl = 3'b001;
       end
    else if( (aluOp == 2'b10) && (funct3 == 3'b0) && !funct7_bit5) begin
        aluControl = 3'b000;
     end
    else if( (aluOp == 2'b10) && (funct3 == 3'b0) && funct7_bit5) begin
        aluControl = 3'b001;
     end
    else if( (aluOp == 2'b10) && (funct3 == 3'b111)) begin
         aluControl = 3'b010; 
       //  $display("aluOp was %b and funct3 was %b so it is and function aluControl is %b at time: ",aluOp,funct3,aluControl,$time);
     end
    else if( (aluOp == 2'b10) && (funct3 == 3'b110)) begin
         aluControl = 3'b011;
     end
    else if( (aluOp == 2'b10) && (funct3 == 3'b010)) begin
         aluControl = 3'b101;
     end else begin
            aluControl = 3'b000;
      end
end    
endmodule






