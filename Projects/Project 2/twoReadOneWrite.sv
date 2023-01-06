// Mark Mitri
// ECE 201
// Project 2
// Part 1: two-read one-write Register

module registerfile (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clk);
    
  input [4:0] Read1, Read2, WriteReg; // typo was making the read/write 6 wide instead of 5 wide
  input [63:0] WriteData;
  input RegWrite, clk;
  output [63:0] Data1, Data2;
  
  reg [63:0] RF [31:0];
  
  assign Data1 = RF[Read1];
  assign Data2 = RF[Read2];
  
  initial $readmemh("file.txt",RF);
  
  always @(posedge clk)
  begin
    if(RegWrite)
      RF[WriteReg] <= WriteData;
  end
endmodule