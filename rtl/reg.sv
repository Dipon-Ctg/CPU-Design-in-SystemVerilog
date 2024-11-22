//Register File

module register_file (
  input logic clk, reset, RegWrite,
  input logic [1:0] rs1,rs2,rd,
  input logic [11:0] WriteData,
  output logic [11:0] rd1,rd2
);
  
  logic [11:0] Registers [3:0];
  
  always_ff @(posedge clk or posedge reset)
    begin
      if (reset)
        /*
        //manually assign value rather than using a loop
        begin
          Registers[0] <=12'b0;
          Registers[1] <=12'b0;
          Registers[2] <=12'b0;
          Registers[3] <=12'b0;
        end
        */
        begin
          for (int k=0; k<4; k=k+1)
            begin
              Registers[k] <= 12'b00;
            end
        end
      else if (RegWrite)
        begin
          Registers[rd] <= WriteData;
        end
    end
  
  assign rd1 = Registers[rs1];
  assign rd2 = Registers[rs2];
  
endmodule

