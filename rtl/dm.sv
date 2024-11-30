//Data Memory
/*
module data_memory (
  input logic clk,reset,MemWrite,MemRead,
  input logic [11:0] address,wd2,
  output logic [11:0] MemData_out
);
  logic [11:0] D_Memory [24];
  
  always_ff @(posedge clk or posedge reset)
    begin
      if (reset)
        begin
          for (int k=0; k<24; k++)
            begin
              D_Memory [k] <= 12'b00;
            end
        end
      else if (MemWrite)
        begin
          D_Memory [address] <= wd2;
        end
    end
  assign MemData_out = (MemRead) ? D_Memory [address]: 12'b00;
  
endmodule
*/
module data_memory (
  input logic clk,reset,MemWrite,MemRead,
  input logic [3:0] address,wd2,
  output logic [3:0] MemData_out
);
  logic [3:0] D_Memory [15:0];
  
  always_ff @(posedge clk or posedge reset)
    begin
      if (reset)
        begin
          for (int k=0; k<16; k++)
            begin
              D_Memory [k] <= 4'b00;
            end
        end
      else if (MemWrite)
        begin
          D_Memory [address] <= wd2;
        end
    end
  assign MemData_out = (MemRead) ? D_Memory [address]: 4'b00;
  
endmodule


