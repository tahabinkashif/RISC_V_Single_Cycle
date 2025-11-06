`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 14:46:31
// Design Name: 
// Module Name: test_bench
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


module test_bench;
    /*reg [31:0] instruction;
    wire [2:0] aluControl,ImmSrc,resultSrc;
    wire branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr;
    
    control_unit cu(instruction,aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
    
    initial begin

        // ===== R-TYPE INSTRUCTIONS =====
        instruction = 32'b00000000011100110000001010110011; // ADD x3,x1,x2
        #2;
        $display("ADD: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b01000000011100110000001010110011; // SUB x3,x1,x2
        #2;
        $display("SUB: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000011100110111001010110011; // AND x3,x1,x2
        #2;
        $display("AND: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000011100110110001010110011; // OR x3,x1,x2
        #2;
        $display("OR: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000011100110010001010110011; // SLT x3,x1,x2
        #2;
        $display("SLT: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
    
        // ===== I-TYPE INSTRUCTIONS =====
        instruction = 32'b00000000101000001000001010010011; // ADDI x5,x1,10
        #2;
        $display("ADDI: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000101000001111101010010011; // ANDI x5,x1,10
        #2;
        $display("ANDI: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000101000001110001010010011; // ORI x5,x1,10
        #2;
        $display("ORI: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000101000001010101010010011; // SLTI x5,x1,10
        #2;
        $display("SLTI: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
    
        // ===== LOAD / STORE =====
        instruction = 32'b00000001010000001010000110000011; // LW x6,20(x1)
        #2;
        $display("LW: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000011100001010011000100011; // SW x7,24(x1)
        #2;
        $display("SW: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
    
        // ===== BRANCH INSTRUCTIONS =====
        instruction = 32'b00000000001000001000000001100011; // BEQ x1,x2,8
        #2;
        $display("BEQ: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000001000001000100001100011; // BNE x1,x2,8
        #2;
        $display("BNE: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000001000001010000001100011; // BLT x1,x2,8
        #2;
        $display("BLT: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000001000001010100001100011; // BGE x1,x2,8
        #2;
        $display("BGE: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
    
        // ===== JUMP INSTRUCTIONS =====
        instruction = 32'b00000000000000000000000011101111; // JAL x0,0
        #2;
        $display("JAL: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000001000000010000000011100111; // JALR x1,x2,16
        #2;
        $display("JALR: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
    
        // ===== U-TYPE =====
        instruction = 32'b00000000000000001010000010110111; // LUI x1,10
        #2;
        $display("LUI: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;
    
        instruction = 32'b00000000000000001010000010010111; // AUIPC x1,10
        #2;
        $display("AUIPC: aluControl=%b ImmSrc=%b resultSrc=%b branch=%b memWrite=%b aluSrc=%b regWrite=%b jump=%b AUIPC_Src=%b jalr=%b",
                 aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
        #8;

    end    */
    
   /* reg clk,rst;
    //wire [31:0] datamemory_3,datamemory_4,register_file_5,register_file_6 ,register_file_7 ;
    wire locked,rst_out,clk_out;
    always #5 clk = ~clk;
    
    //top_module uut(clk,rst,datamemory_3,datamemory_4,register_file_5,register_file_6 ,register_file_7,locked,rst_out,clk_out);
     clk_wiz_0 uut(clk_out,rst,locked,clk);
    initial begin
    rst = 0;
    clk = 0;
    #10
    rst = 0;
    
    end*/
    
      // Inputs
      reg clk_in1 = 0;
      reg reset = 0;
    
      // Outputs
      wire clk_out1;
      wire locked;
    
      // Clock period for input clock (e.g., 100 MHz input ? 10 ns period)
      localparam real CLK_IN_PERIOD = 10.0;
    
      // Instantiate the DUT (clk_wiz_0 is generated by Vivado IP)
      clk_wiz_0 uut (
        .clk_out1(clk_out1),
        .reset(reset),
        .locked(locked),
        .clk_in1(clk_in1)
      );
    
      // Input clock generator
      always #(CLK_IN_PERIOD/2) clk_in1 = ~clk_in1;
    
      // Test sequence
      initial begin
        // Initial conditions
        reset = 1;        // hold reset high
        #100;             // wait 100 ns
    
        reset = 0;        // release reset
        $display("[%0t] Reset deasserted", $time);
    
        // Run simulation long enough to observe LOCKED and clk_out1
        #1000;
    
        $finish;
      end
    
    endmodule
