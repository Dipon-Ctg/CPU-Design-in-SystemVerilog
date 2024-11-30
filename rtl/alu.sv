//ALU
/*
module ALU_unit(
  input logic [11:0] SrcA,SrcB,
  input logic [2:0] Control_in,
  output logic zero,
  output logic [11:0] ALUResult
);
  
  always_comb
    begin
      case(Control_in)
        3'b001:
          begin 
            zero = 0; 
            ALUResult = SrcA + SrcB;	//ADD
          end
        3'b010: 
          begin 
            zero = 0; 
            ALUResult = SrcA - SrcB;	//SUB
          end
        3'b011: 
          begin 
            zero = 0; 
            ALUResult = SrcA & SrcB;	//AND
          end
        3'b100: 
          begin 
            zero = 0;
            ALUResult = SrcA | SrcB;	//OR
          end
        3'b101: 
          begin 
            zero = 0; 
            ALUResult = SrcA ^ SrcB;	//XOR
          end
        3'b110: 
          begin 
            ALUResult = SrcA - SrcB;
            zero = (SrcA == SrcB);
          end
        default:
          begin
            zero = 0;
            ALUResult = 12'b0;
          end
      endcase
      
    end
endmodule
*/

module ALU_unit(
  input logic [3:0] SrcA,SrcB,
  input logic [2:0] Control_in,
  output logic zero,
  output logic [3:0] ALUResult
);
  
  always_comb
    begin
      zero = 0;
      ALUResult = 4'b0;
      
      case(Control_in)
        3'b001:
          begin 
            ALUResult = SrcA + SrcB;	//ADD
          end
        3'b010: 
          begin 
            ALUResult = SrcA - SrcB;	//SUB
          end
        3'b011: 
          begin  
            ALUResult = SrcA & SrcB;	//AND
          end
        3'b100: 
          begin 
            ALUResult = SrcA | SrcB;	//OR
          end
        3'b101: 
          begin 
            ALUResult = SrcA ^ SrcB;	//XOR
          end
        3'b110: 
          begin 
            ALUResult = SrcA - SrcB;
            zero = (SrcA == SrcB);		// Set zero to 1 if SrcA equals SrcB
          end
        default:
          begin
            // Outputs remain initialized
          end
      endcase
      
    end
endmodule



