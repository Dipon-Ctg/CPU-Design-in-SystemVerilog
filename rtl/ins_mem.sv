//Instruction Memory
module instruction_memory (
  input logic clk,reset,
  input logic [11:0] read_address,
  output logic [11:0] instruction
);
  
  logic [11:0] memory_array [23:0];	// Memory array to hold instructions
  
  always_ff @(posedge clk or posedge reset)
    begin
      if (reset)
        begin
        for (int k =0; k <24; k++)
          begin
            memory_array[k] <= 12'b0;
          end
          instruction <= 12'b0;		//Clean output during reset
        end
      else
        //Fetch the instruction if the address is valid
        begin
          if (read_address < 24)
            instruction <= memory_array [read_address];
          else 
            instruction <= 12'b0; //Handle invslid address
        end
    end
  
endmodule
