
module program_counter (
    input logic clk,                  // Clock signal
    input logic reset,                // Reset signal
    input logic jump,                 // Jump signal from control unit
    input logic branch_taken,         // Branch decision signal (Branch & alu_zero)
    input logic [3:0] branch_addr,   // Target address for branch
    input logic [3:0] jump_addr,     // Target address for jump
    output logic [3:0] pc            // Current program counter
);

  logic [3:0] next_pc;             // Next value of the program counter

    always_comb begin
        // Default: Increment PC by 1 for sequential execution
        next_pc = pc + 1;

        // If branch is taken, update PC to branch address
        if (branch_taken)
            next_pc = branch_addr;

        // If jump instruction, update PC to jump address
        if (jump)
            next_pc = jump_addr;
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 12'd0;              // Reset PC to 0 on reset
        else
            pc <= next_pc;            // Update PC on clock edge
    end

endmodule

/* Program Counter
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
  
endmodule */

