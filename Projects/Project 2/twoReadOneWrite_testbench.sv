// Mark Mitri
// ECE 201
// Project 2
// Part 1 Testbench

// inputs -> registers
// outputs -> wires

module twoRead_oneWrite_testbench();
  reg[4:0] R1, R2, WR;
  reg[63:0] WD;
  reg RW, clk;
  wire[63:0] D1, D2;
  
  registerfile u_dut(.Read1(R1), .Read2(R2), .WriteReg(WR), .WriteData(WD), .RegWrite(RW), .Data1(D1), .Data2(D2), .clk(clk));

  always #5 clk = ~clk;
  
  initial 
    begin
    	$dumpfile("dump.vcd"); 
  		$dumpvars;
    end
  
  initial
    begin
      clk = 1;
      RW = 0;
      R1 = 5'd0;
      R2 = 5'd0;
      WR = 5'd0;
      WD = 64'd0;
      
      #40 WD = 64'd3456;
      #1  WR = 5'd2;
      #1  RW = 1;
      #15 RW = 0;
          WD = 64'd0;
          WR = 5'd0;
      
      #40 WD = 64'd6453;
      #1  WR = 5'd19;
      #1  RW = 1;
      #15 RW = 0;
          WD = 64'd0;
          WR = 5'd0;
      
      #40 WD = 64'd6453;
      #1  WR = 5'd31;
      #1  RW = 1;
      #15 RW = 0;
          WD = 64'd0;
          WR = 5'd0;
 
      #40 R1 = 5'd31;
          R2 = 5'd19;
      #10 R1 = 5'd19;
          R2 = 5'd2;
      #15
    $finish;
    end
endmodule