// Immediate Generator

module ImmGen (
  input logic [11:0] instruction,
  output logic [11:0] ImmExit
);
  // Not added all features
  assign ImmExit = instruction;
  
endmodule
