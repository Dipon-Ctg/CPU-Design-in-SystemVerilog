// Program Counter
module program_counter (
  input logic clk,reset,
  input logic [11:0] pc_next,		//Program counter input
  output logic [11:0] pc_current	//Program counter output
);
  
  always_ff @(posedge clk or posedge reset)
    begin
      if (reset)
        pc_current <= 12'b000000000000;
      else
        pc_current <= pc_next;
    end
  
endmodule


//Program Counter Adder

module pc_adder (
  input logic[11:0] pc_current,		//Current program counter value
  output logic [11:0] pc_next	//Next program counter value (incremented by 1)
);
  assign pc_next = pc_current + 1;	//Increment by 1
  
endmodule

