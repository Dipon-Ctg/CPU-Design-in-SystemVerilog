//Control Unit

module control_unit (
  input logic clk,reset,		//Without FSM we have remove it
  input logic [3:0] opcode,
  output logic RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg,
  output logic [2:0] ALUControl
);
  
  
  /*
  //Verilog
  always @(*)
    begin
      case (opcode)
        4'b0000: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'100000_001;  //ADD
        4'b0001: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'100000_010;	//SUB
        4'b0010: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'100000_011;	//AND
        4'b0011: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'100000_100;	//OR
        4'b0100: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'100000_101;	//XOR
        4'b0101: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'101101_000;	//LD
        4'b0110: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'010100_000;	//ST
        //4'b0111: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'000000_000;	//Jump
        4'b1000: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'000010_001;	//BEQ
        4'b1001: {RegWrite, MemWrite, MemRead, ALUSrc, Branch, ResultReg, ALUControl} <= 9'000010_001;	//BNE
        
      endcase
      
    end
  */
  
  
  //With FSM
  typedef enum logic [2:0] {
    FETCH = 3'b000,
    DECODE = 3'b001,
    EXECUTE = 3'b010,
    MEM_ACCESS = 3'b011,
    WRITE_BACK = 3'b100
  } state_t;
  
  state_t current_state, next_state;
  
  always_ff @(posedge clk or posedge reset)
    begin
      if(reset)
        current_state <= FETCH;
      else
        current_state <= next_state;
    end
  //Default value for control signals
  always_comb
    begin
      RegWrite = 0;
      MemWrite = 0;
      MemRead = 0;
      ALUSrc = 0;
      Branch = 0;
      ResultReg = 0;
      ALUControl = 3'b000;
      
      next_state = FETCH;
      
      case (current_state)
        FETCH:
          begin
            next_state = DECODE;
          end
        DECODE:
          begin
            case(opcode)
              4'b0000:
                begin
                  RegWrite = 1;	//ADD
                  ALUControl = 3'b001;
                  next_state = EXECUTE;
                end
              4'b0001:
                begin
                  RegWrite = 1;	//SUB
                  ALUControl = 3'b010;
                  next_state = EXECUTE;
                end
              4'b0010:
                begin
                  RegWrite = 1;	//AND
                  ALUControl = 3'b011;
                  next_state = EXECUTE;
                end
              4'b0011:
                begin
                  RegWrite = 1;	//OR
                  ALUControl = 3'b100;
                  next_state = EXECUTE;
                end
              4'b0100:
                begin
                  RegWrite = 1;	//XOR
                  ALUControl = 3'b101;
                  next_state = EXECUTE;
                end
              4'b0101:
                begin
                  ALUSrc = 1;	//LD
                  ResultReg = 1;
                  RegWrite = 1;
                  MemRead = 1;
                  next_state = MEM_ACCESS;
                end
              4'b0110:
                begin
                  ALUSrc = 1;	//ST
                  MemWrite = 1;
                  next_state = MEM_ACCESS;
                end
              4'b1000:
                begin 		//BEQ
                  Branch = 1;
                  ALUControl = 3'b110;
                  next_state = FETCH;
                end
              4'b1001:
                begin
                  Branch = 1;	//BNE
                  ALUControl = 3'b110;
                  next_state = FETCH;
                end
              default:
                begin
                  next_state = FETCH;
                end
            endcase
          end
        EXECUTE: 
          begin
            if(opcode == 4'b0101 || opcode == 4'b0110) //LD or ST
              next_state = MEM_ACCESS;
            else
              next_state = WRITE_BACK;
          end
        MEM_ACCESS:
          begin
            if (opcode == 4'b0101)	//LD
              next_state = WRITE_BACK;
            else
              next_state = FETCH;
          end
        WRITE_BACK:
          begin
            next_state = FETCH;
          end
      endcase
      
    end
  
endmodule
  
  /*
  //Without FSM
  always_comb
    begin
      RegWrite = 1'b0;
      MemWrite = 1'b0;
      MemRead = 1'b0;
      ALUSrc = 1'b0;
      Branch = 1'b0;
      ResultReg = 1'b0;
      ALUControl = 3'b000;
      
      case (opcode)
        4'b0000:
          begin		//ADD
            RegWrite = 1'b1;
            ALUControl = 3'b001;
          end
        4'b0001:
          begin		//SUB
            RegWrite = 1'b1;
            ALUControl = 3'b010;
          end
        4'b0010:
          begin		//AND
            RegWrite = 1'b1;
            ALUControl = 3'b011;
          end
        4'b0011:
          begin		//OR
            RegWrite = 1'b1;
            ALUControl = 3'b100;
          end
        4'b0100:
          begin		//XOR
            RegWrite = 1'b1;
            ALUControl = 3'b101;
          end
        4'b0101:
          begin		//LD
            ALUSrc = 1'b1;
            ResultReg = 1'b1;
            RegWrite = 1'b1;
            MemRead = 1'b1;
          end
        4'b0110:
          begin		//ST
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
          end
          
        
        4'b0111:
          begin		//Jump
            //Can add the jump instruction
          end
        
        
        4'b1000:
          begin		//BEQ
            Branch = 1;
            ALUControl = 3'b001;
          end
         4'b1001:
          begin		//BNE
            Branch = 1;
            ALUControl = 3'b001;
          end
        default: begin
          //All the signals at default (no_operation)
        end
        
      endcase
      
    end
    
endmodule
    */

