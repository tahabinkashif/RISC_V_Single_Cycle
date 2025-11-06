`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 14:13:40
// Design Name: 
// Module Name: main_decoder
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


(* DONT_TOUCH = "true" *) module main_decoder(
    input wire [6:0] opcode,
    output reg branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr,
    output reg [2:0] ImmSrc,
    output reg [1:0] resultSrc,
    output reg [1:0] aluOp
  );
  
      localparam R_TYPE  = 7'b0110011;
      localparam I_TYPE  = 7'b0010011;
      localparam LOAD    = 7'b0000011;
      localparam STORE   = 7'b0100011;
      localparam BRANCH  = 7'b1100011;
      localparam JAL     = 7'b1101111;
      localparam JALR    = 7'b1100111;
      localparam LUI     = 7'b0110111;
      localparam AUIPC   = 7'b0010111;
          
  initial begin
    ImmSrc = 2'b00;
    aluOp = 2'b00;
    resultSrc = 2'b00;
    branch = 0;
    memWrite = 0;
    aluSrc = 0;        
    regWrite = 0;
    jump = 0;
    AUIPC_Src = 0;
    jalr = 0;
 end
   
 always @(*) begin
 
              // Default values
              branch    = 0;
              resultSrc = 0;
              memWrite  = 0;
              aluSrc    = 0;
              ImmSrc    = 3'b000;
              regWrite  = 0;
              aluOp     = 2'b00;
              AUIPC_Src = 0;
              jalr = 0;
              jump = 0;
              AUIPC_Src = 0;
          
              case(opcode)
                  R_TYPE: begin
                      regWrite  = 1;
                      aluSrc    = 0;
                      resultSrc = 2'b00;
                      aluOp     = 2'b10;  // ALU control from funct fields
                  end
                  
                  I_TYPE: begin
                      regWrite  = 1;
                      aluSrc    = 1;
                      resultSrc = 2'b00;
                      ImmSrc    = 3'b000;  // I-type immediate
                      aluOp     = 2'b10;
                  end
                  
                  LOAD: begin
                      regWrite  = 1;
                      aluSrc    = 1;
                      resultSrc = 2'b01;      // Result comes from memory
                      ImmSrc    = 3'b000;  // I-type immediate
                      aluOp     = 2'b00;  // ALU does ADD
                  end
                  
                  STORE: begin
                      memWrite  = 1;
                      aluSrc    = 1;
                      ImmSrc    = 3'b001;  // S-type immediate
                      aluOp     = 2'b00;  // ALU does ADD
                  end
                  
                  BRANCH: begin
                      branch    = 1;
                      aluOp     = 2'b01;  // ALU does SUB
                      ImmSrc    = 3'b010;  // B-type immediate
                  end
                  
                  JAL: begin
                      regWrite  = 1;
                      jump    = 1;
                      ImmSrc    = 3'b011;  // J-type immediate
                      resultSrc = 2'b10; 
                  end
                  
                  LUI: begin
                      regWrite  = 1;
                      ImmSrc    = 3'b100;  // U-type immediate
                      resultSrc = 2'b11;
                  end
                  
                  JALR: begin // JALR (I-type but for jump)
                              regWrite = 1;
                              resultSrc = 2'b10; // PC + 4 stored in rd
                              jalr = 1;       // Enable branch/jump
                              aluSrc = 1;       // Use immediate for target address
                              aluOp = 2'b00;    // ALU does addition (rs1 + imm)
                              ImmSrc = 3'b000;   // I-type immediate
                          end
                  
                   AUIPC: begin
                              branch    = 0;
                              memWrite  = 0;
                              resultSrc = 2'b11;
                              ImmSrc    = 3'b100; // U-type immediate
                              regWrite  = 1;
                              AUIPC_Src = 1;
                          end

                  default: begin
                      // All signals remain default
                  end
              endcase
          end

  



endmodule
