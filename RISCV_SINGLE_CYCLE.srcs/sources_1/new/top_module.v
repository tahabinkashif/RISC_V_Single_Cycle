`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 14:15:08
// Design Name: 
// Module Name: top_module
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


module top_module(
    input wire clk_raw,rst_raw, //input 
    output wire [7:0] datamemory_3,
    output wire [6:0] datamemory_4,
   // output wire [31:0] register_file_5,register_file_6 ,register_file_7, //Output for testbench or LEDs
    output wire led
    );
    
    //Signals
    wire [31:0]data_memory_3,data_memory_4;
    wire pcSrc;
    wire [31:0] pc_inputAdrs,pc_outputAdrs,pc_plus4,pc_plusImm,jalr_adrs,instruction,resultW,RD1,RD2,aluResult,readData,ImmExt;
    wire [2:0] aluControl,ImmSrc;
    wire [1:0] resultSrc;
    wire branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr;
    wire V,C_or_B,N,Z,locked,clk,rst;
    
    //wire [31:0] register_file_
    assign datamemory_3 = data_memory_3[7:0];
    assign datamemory_4 = data_memory_3[14:8];
    assign led = rst;
    //Module Instatiation  
    //RESET debouncing
    //debounce_rst rst_debounce_module(clk_raw,rst_raw,rst1);
    clk_wiz_0 clk_wiz(clk,rst_raw,locked,clk_raw);
    clocking_wizard_module rst_locked(rst_raw,locked,rst);
    ila_0 ILA(clk,pc_plus4,pc_plusImm,pc_outputAdrs,data_memory_3);
    
    //assign datamemory_4 = data_memory_4[6:0];
    //MULTIPLEXERS  
    pcMUX pc_MUX(pc_plus4,pc_plusImm,jalr_adrs,jalr,pcSrc,jump,pc_inputAdrs);
    resultSrc_MUX resultMUX(resultSrc,AUIPC_Src,aluResult,readData,pc_plus4,pc_plusImm,ImmExt,resultW);
    

    //ALUs
    main_alu_32bit mainALU(aluSrc,aluControl,RD1,RD2,ImmExt,aluResult,V,C_or_B,N,Z);
    pc_plus4_ALU pc_ALU(pc_outputAdrs,pc_plus4);
    pc_plusImm pc_Imm_ALU(ImmExt,pc_outputAdrs,pc_plusImm);
    
    //STATE ELEMENTS
    program_counter pc(clk,rst,pc_inputAdrs,pc_outputAdrs);
    instruction_memory instr_mem(pc_outputAdrs,instruction);
    register_file rf(regWrite,clk,rst,instruction[19:15],instruction[24:20],instruction[11:7],resultW,RD1,RD2); //,register_file_5,register_file_6 ,register_file_7);
    data_memory main_memory(clk,memWrite,RD2,aluResult,readData,data_memory_3,data_memory_4);
    
    
    //Control Unit (Main Decoder & ALU Control)
    control_unit cu(instruction[6:0],instruction[14:12],instruction[30],aluControl,ImmSrc,resultSrc,branch,memWrite,aluSrc,regWrite,jump,AUIPC_Src,jalr);
    
    //Logic Modules
    Imm_Extension Immediate_Extension(instruction[31:7],ImmSrc,ImmExt);
    JALR_module jalrmod(jalr,aluResult,jalr_adrs);
    branch_logic_module branchLogic(branch,Z,V,N,C_or_B,instruction[14:12],pcSrc);
         
endmodule












