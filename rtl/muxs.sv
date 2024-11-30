//Multiplexers
/*
//Mux1
module mux1 (
  input logic sel1,
  input logic [11:0] a,b,
  output logic [11:0] mux1_out
);
  assign mux1_out = (sel1==1'b0) ? a:b;
endmodule
  
//Mux2
module mux2 (
  input logic sel2,
  input logic [11:0] a,b,
  output logic [11:0] mux2_out
);
  assign mux2_out = (sel2==1'b0) ? a:b;
endmodule

//Mux3
module mux3 (
  input logic sel3,
  input logic [11:0] a,b,
  output logic [11:0] mux3_out
);
  assign mux3_out = (sel3==1'b0) ? b:a;
endmodule
*/

//Mux1
module mux1 (
  input logic sel1,
  input logic [3:0] a,b,
  output logic [3:0] mux1_out
);
  assign mux1_out = (sel1==1'b0) ? a:b;
endmodule
  
//Mux2
module mux2 (
  input logic sel2,
  input logic [3:0] a,
  input logic [1:0] b,
  output logic [3:0] mux2_out
);
  assign mux2_out = (sel2==1'b0) ? a:b;
endmodule

//Mux3
module mux3 (
  input logic sel3,
  input logic [3:0] a,b,
  output logic [3:0] mux3_out
);
  assign mux3_out = (sel3==1'b0) ? b:a;
endmodule
        

