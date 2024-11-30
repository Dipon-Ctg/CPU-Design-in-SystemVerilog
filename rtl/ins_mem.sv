//Instruction Memory
/*
module instruction_memory (
  input logic clk,reset,
  input logic wr_en,
  input logic [3:0] addr,
  input logic [11:0] write_data,
  output logic [11:0] instruction
);
  
  logic [11:0] memory_array [15:0];	// Memory array to hold instructions
  
  always_ff @(posedge clk or posedge reset)
    begin
      if (reset)
        begin
          for (int k =0; k <16; k++)
          begin
            memory_array[k] <= 12'b0;
          end
          instruction <= 12'b0;		//Clean output during reset
        end
      else if (write_en)
        begin
          mem[addr] <= write_data; 
        end
      else
        //Fetch the instruction if the address is valid
        begin
          if (addr < 16)
            instruction <= memory_array [addr];
          else 
            instruction <= 12'b0; //Handle invslid address
        end
    end
  
endmodule
*/

module instruction_memory (
  input logic clk,reset,
  input logic [3:0] read_address,	//Address width instruction [15:0]
  output logic [11:0] instruction
);
  
  logic [11:0] memory_array [15:0];	// Memory array to hold instructions
  
  always_ff @(posedge clk or posedge reset)
    begin
      if (reset)
        begin
          for (int k =0; k <16; k++)
            memory_array[k] <= 12'b0;
         
          instruction <= 12'b0;		//Clean output during reset
        end
      else
        //Fetch the instruction if the address is valid
        begin
          instruction <= memory_array[read_address]; 
        end
    end
  
  
endmodule
