//ALU Control
/*
module alu_control (
  input logic [1:0] instruction,
  input logic [2:0] ALUControl,
  output logic [2:0] control_out
);
  always_comb
    begin
      case (instruction)
        2'b00: control_out = ALUControl;	//Default
        //2'b01: control_out = 3'b001;	//ADD
        //2'b10: control_out = 3'b001;	//SUB
        //2'b11: control_out = 3'b001;	//AND
      endcase
    end
    
  /*
  always_comb
    begin
      case ({instruction, ALUControl})
        5'b00_001: control_out = 3'b001; //ADD instruction depends on instruction(func input) and ALUControl Signal
        5'b01_010: control_out = 3'b010;
      endcase
    end
    
         
  //assign control_out = ALUControl;
  
endmodule
  
*/
