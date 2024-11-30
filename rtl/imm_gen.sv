// Immediate Generator
/*
module ImmGen (
  input logic [11:0] instruction,
  output logic [11:0] ImmExit
);
  // Not added all features
  assign ImmExit = instruction;
  
endmodule
*/
module ImmGen (
  input logic [1:0] instruction,
  output logic [1:0] ImmExit
);
  
  assign ImmExit = instruction;
  
endmodule
