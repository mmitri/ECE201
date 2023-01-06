// Mark Mitri
// ECE 201
// Project 2
// Part 3

module datapath(C, V, N, Z, RF_out,A,B,out,ALUSel,RF_add,Mux,RF_w,ALU_out,Mux_out, clk);
  output C,V,N,Z // Flags
  output [7:0] RF_out;
  input [7:0] A,B,out;
  input [4:0] ALUSel, RF_add;
  input Mux, RF_w, clk;
  wire [7:0] ALU_out, Mux_out;

  aluBehav alu_behav(.ALUctl(ALUSel),.A(A),.B(B),.ALUOut(ALU_out).carryout(C),.zero(Z),.overflow(V),.negative(N));
  
  register_file registerfile(.Read1(RF_out),.Read2(),.WriteReg(),.WriteData(),.RegWrite(),.Data1(),.Data2(),.clk(clk));
        
endmodule 