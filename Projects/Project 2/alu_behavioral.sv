// Mark Mitri
// ECE 201
// Project 2
// Part 2

module alu_behav(ALUctl, A, B, ALUOut, carryout, zero, overflow, negative);
  input [3:0] ALUctl;
  input [63:0] A,B;
  output reg [63:0] ALUOut;
  output carryout;
  output zero;
  output overflow;
  output negative;
  wire [8:0] tmp;
  assign tmp = {1'b0,A} + {1'b0,B};
  assign carryout = tmp[8];
  
  always @(ALUctl, A, B) begin
    case (ALUctl)
      4'b0000: ALUOut <= A & B; // AND
      4'b0001: ALUOut <= A | B; // ORR
      4'b0010: ALUOut <= A + B; // ADD
      4'b0011: ALUOut <= A + B; // ADDS (Add with flags
      4'b0110: ALUOut <= A - B; // SUB 
      4'b0111: ALUOut <= A - B; // SUBS (Sub with flags
      4'b1001: ALUOut <= A << B; // LSL
      4'b1100: ALUOut <= A ^ B; // EOR
      default: ALUOut <= 0;
    endcase
  end
  
  assign overflow = ALUOut[63] ^ ALUOut[62];
  assign zero = (ALUOut == 0)? 1'b1 : 1'b0;
endmodule


