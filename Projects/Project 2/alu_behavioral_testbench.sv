// Mark Mitri
// ECE 201
// Project 2
// Part 2
// Testbench

`timescale 1ns / 1ns  

module alu_behav_testbench;

 reg[63:0] A,B;
 reg[3:0] ALUctl;
 wire[63:0] ALUOut;
 wire carryout;
 wire zero;
 wire overflow;
 wire negative;
 integer i;
  alu_behav dut(.ALUctl(ALUctl),.A(A),.B(B), .ALUOut(ALUOut),.carryout(carryout),.zero(zero),.overflow(overflow),.negative(negative));
  
 initial 
   begin
     $dumpfile("dump.vcd"); 
     $dumpvars;
   end
  
 initial begin
   A = 63'b10100011;
   B = 63'b11110101;
   ALUctl = 4'b0000;
   for (i=0;i<=15;i=i+1) begin
     ALUctl = ALUctl + 4'b0001;
     #10;
   end;
   A = 63'b10100100;
   B = 63'b01011100;
 end
endmodule