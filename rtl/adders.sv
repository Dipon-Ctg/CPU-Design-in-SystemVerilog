//Adder
/*
module add_gate (
  input logic zero, Branch,
  output logic add_out
);
  assign add_out = zero & Branch;
  
endmodule
  

//Adder 

module adder (
  input logic [11:0] in_1, in_2,
  output logic [11:0] adder_out
);
  assign adder_out = in_1 + in_2;
  
endmodule
*/

module adder (
  input logic [3:0] in_1,
  input logic [1:0] in_2,
  output logic [3:0] adder_out
);
  assign adder_out = in_1 + in_2;
  
endmodule
