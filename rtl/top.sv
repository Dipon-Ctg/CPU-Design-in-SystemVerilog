
//Top module
/*
module top (
  input logic clk,reset
);
  
  logic [11:0] instruction_top,write_datatop, rd1_top,rd2_top,ImmExit_top,mux1_out_top,adder_out_top,mux2_out_top,ALUResult_top,MemData_out_top,mux3_out_top;
  logic [3:0] pc_top,pc_nex_top;
  logic RegWrite_top,ALUSrc_top,Branch_top,zero_top,add_out_top,MemWrite_top,MemRead_top,ResultReg_top,wr_entop;
  logic [2:0] ALUControl_top,control_out_top;
  
  //Program counter
  program_counter pc_inst (
    .clk(clk),
    .reset(reset),
    .pc_next(mux2_out_top),
    .pc_current (pc_top)
  );
  
  ////Program Counter Adder
  pc_adder pc_adder_inst (
    .pc_current(pc_top),
    .pc_next(pc_next_top)
  );
  
  //Instruction Memory
  instruction_memory instruction_memory_inst (
    .clk(clk),
    .reset(reset),
    .wr_en(wr_entop),
    .write_data(write_datatop),
    .addr(pc_top),
    .instruction(instruction_top)
  );
  
  //Register File
  register_file register_file_inst (
    .clk(clk),
    .reset(reset),
    .RegWrite(RegWrite_top),
    .rs1(instruction_top[5:4]),
    .rs2(instruction_top[7:6]),
    .rd(instruction_top[9:8]),
    .WriteData(mux3_out_top),
    .rd1(rd1_top),
    .rd2(rd2_top)
  );
  
  // Immediate Generator
  ImmGen ImmGen_inst (
    .instruction(instruction_top),
    .ImmExit(ImmExit_top)
  );
  
  //Control Unit
  control_unit control_unit_inst (
    .clk(clk),
    .reset(reset),
    .opcode(instruction_top[3:0]),
    .RegWrite(RegWrite_top),
    .MemWrite(MemWrite_top),
    .MemRead(MemRead_top),
    .ALUSrc(ALUSrc_top),
    .Branch(Branch_top),
    .ResultReg(ResultReg_top),
    .ALUControl(ALUControl_top)
  );
  
  ////ALU Control
  alu_control alu_control_inst (
    .instruction(instruction_top[11:10]),
    .ALUControl(ALUControl_top),
    .control_out(control_out_top)
  );
  
  
  //ALU
    ALU_unit ALU_unit_inst (
      .SrcA(rd1_top),
      .SrcB(mux1_out_top),
      .Control_in(control_out_top),
      .zero(zero_top),
      .ALUResult(ALUResult_top)
    );
 
  //MUX1
  mux1 mux1_inst(
    .sel1(ALUSrc_top),
    .a(rd2_top),
    .b(ImmExit_top),
    .mux1_out(mux1_out_top)
  );
  
  
  //Adder
  adder adder_inst (
    .in_1(pc_top),
    .in_2(ImmExit_top),
    .adder_out(adder_out_top)
  );
  
  
  //Add_Gate
  add_gate add_gate_inst (
    .zero(zero_top),
    .Branch(Branch_top),
    .add_out(add_out_top)
  );
  
  //MUX2
  
  mux2 mux2_inst (
    .sel2(add_out_top),
    .a(pc_next_top),
    .b(adder_out_top),
    .mux2_out(mux2_out_top)
  );
  
  //Data Memory
  data_memory data_memory_inst (
    .clk(clk),
    .reset(reset),
    .MemWrite(MemWrite_top),
    .MemRead(MemRead_top),
    .address(ALUResult_top),
    .wd2(rd2_top),
    .MemData_out(MemData_out_top)
  );
  
  //MUX3
  mux3 mux3_inst (
    .sel3(ResultReg_top),
    .a(MemData_out_top),
    .b(ALUResult_top),
    .mux3_out(mux3_out_top)
  );
    
endmodule
*/

module top (
  input logic clk,reset
);
  
  logic [3:0] pc_next_top,pc_top,pc_plus_top,rd1_top,rd2_top,mux2_out_top,PCTarget_top,ALUResult_top,MemData_out_top,mux3_out_top;
  logic [11:0] instruction_top;
  logic [1:0] ImmExit_top;
  logic RegWrite_top,ALUSrc_top,zero_top,MemWrite_top,MemRead_top,ResultSrc_top,PCSrc_top;
  logic [2:0] ALUControl_top;
  
  
  //MUX1
  mux1 mux1_inst(
    .sel1(PCSrc_top),
    .a(pc_plus_top),
    .b(PCTarget_top),
    .mux1_out(pc_next_top)
  );
  
  //Program counter
  program_counter pc_inst (
    .clk(clk),
    .reset(reset),
    .pc_next(pc_next_top),
    .pc_current (pc_top)
  );
  
  ////Program Counter Adder
  pc_adder pc_adder_inst (
    .pc_current(pc_top),
    .pc_next(pc_plus_top)
  );
  
  //Instruction Memory
  instruction_memory instruction_memory_inst (
    .clk(clk),
    .reset(reset),
    .read_address(pc_top),
    .instruction(instruction_top)
  );
  
  //Register File
  register_file register_file_inst (
    .clk(clk),
    .reset(reset),
    .RegWrite(RegWrite_top),
    .rs1(instruction_top[5:4]),
    .rs2(instruction_top[7:6]),
    .rd(instruction_top[9:8]),
    .WriteData(mux3_out_top),
    .rd1(rd1_top),
    .rd2(rd2_top)
  );
  
  // Immediate Generator
  ImmGen ImmGen_inst (
    .instruction(instruction_top[11:10]),
    .ImmExit(ImmExit_top)
  );
  
  //Control Unit
  control_unit control_unit_inst (
    .clk(clk),
    .reset(reset),
    .opcode(instruction_top[3:0]),
    .RegWrite(RegWrite_top),
    .MemWrite(MemWrite_top),
    .MemRead(MemRead_top),
    .ALUSrc(ALUSrc_top),
    .zero(zero_top),
    .PCSrc(PCSrc_top),
    .ResultSrc(ResultSrc_top),
    .ALUControl(ALUControl_top)
  );
  
  
  //ALU
    ALU_unit ALU_unit_inst (
      .SrcA(rd1_top),
      .SrcB(mux2_out_top),
      .Control_in(ALUControl_top),
      .zero(zero_top),
      .ALUResult(ALUResult_top)
    );
 
  //Adder
  adder adder_inst (
    .in_1(pc_top),
    .in_2(ImmExit_top),
    .adder_out(PCTarget_top)
  );
  
  //MUX2
  
  mux2 mux2_inst (
    .sel2(ALUSrc_top),
    .a(rd2_top),
    .b(ImmExit_top),
    .mux2_out(mux2_out_top)
  );
  
  //Data Memory
  data_memory data_memory_inst (
    .clk(clk),
    .reset(reset),
    .MemWrite(MemWrite_top),
    .MemRead(MemRead_top),
    .address(ALUResult_top),
    .wd2(rd2_top),
    .MemData_out(MemData_out_top)
  );
  
  //MUX3
  mux3 mux3_inst (
    .sel3(ResultSrc_top),
    .a(MemData_out_top),
    .b(ALUResult_top),
    .mux3_out(mux3_out_top)
  );
    
endmodule

