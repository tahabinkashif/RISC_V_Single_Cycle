`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 12:55:21
// Design Name: 
// Module Name: instruction_memory
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


(* keep_hierarchy = "yes" *) module instruction_memory(
    input wire [31:0] read_adrs,
    output wire [31:0] instruction
    );

 reg [31:0] memory[0:10];   
 reg [31:0] adress_div4;
 
 
 /* memory[0] = 32'b00000000000100000010001010000011;  //load memory[1] in x5
  memory[1] = 32'b00000001010000000000001111101111;  //JAL jump to instruction memory[6]
  memory[2] = 32'b00000000001000000010001010000011;  //load memory 2 in x5
  memory[6] = 32'b00000000011000000010000110100011;  //SW store x6 on memory[3]
  memory[7] = 32'b00000000100000000000000001100111;  //JALR jump back to instruction memory[2]
  // memory[1] = 32'b00000001100000000000001111100111; //JALR jump to memory[6] and store RA in x7*/
  
  
 initial begin
 
    memory[0] = 32'b00000000000100000010001100000011;  //load data memory[1] in x6
    memory[1] = 32'b00000000001000000010001010000011;  //load data memory[2] in x5
    //memory[2] = 32'b00000000011000101000001100110011;  // add x5 and x6 and store in x7
    memory[2] = 32'b00000000000000000011001110010111;  // AUIPC (pc + Imm in x5)
  //memory[4] = 32'b00000000011000000010000110100011;  // store x6 in data memory [3]
    //memory[2] = 32'b00000000011000101000101001100011;  // BEQ x5,x6,24
    //memory[3] = 32'b00000000011000000010001000100011;  // store x6 in data memory [4]
    memory[3] = 32'b00000000011100000010000110100011;  // store x6 in data memory [3]
    //memory[7] = 32'b00000000011000000010000110100011;  // store x6 in data memory [3]
    memory[4] = 32'b0;
    memory[5] = 32'b0;
    memory[6] = 32'b0;
    memory[7] = 32'b0;
    memory[8] = 32'b0;
    memory[9] = 32'b0;
    memory[10] = 32'b0;
end
  
 always@* begin
    adress_div4 = read_adrs / 4;
 end
 assign instruction = memory[adress_div4]; 
endmodule










