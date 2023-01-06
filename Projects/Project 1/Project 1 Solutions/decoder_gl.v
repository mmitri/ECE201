module decoder_3to8_GL(A, B0, B1, B2, B3, B4, B5, B6, B7);
  
  input [2:0] A;
  output B0, B1, B2, B3, B4, B5, B6, B7;
  
  wire A0_bar, A1_bar, A2_bar; 
  
  // B0 = ~A[0] & ~A[1] & A[2];
  not n1(A2_bar, A[2]);
  not n2(A1_bar, A[1]);
  not n3(A0_bar, A[0]);
  
  and and_gate_1(B0, A2_bar, A1_bar, A0_bar);
  and and_gate_2(B1, A2_bar, A1_bar, A[0]);
  and and_gate_3(B2, A2_bar, A[1], A0_bar);
  and and_gate_4(B3, A2_bar, A[1], A[0]);
  and and_gate_5(B4, A[2], A1_bar, A0_bar);
  and and_gate_6(B5, A[2], A1_bar, A[0]);
  and and_gate_7(B6, A[2], A[1], A0_bar);
  and and_gate_8(B7, A[2], A[1], A[0]);
  
endmodule

module decoder_3to8_GL_test();
  reg [2:0] A;
  reg eof;  
  wire B0, B1, B2, B3, B4, B5, B6, B7;
  reg clk;
  integer data_file; 
  
  decoder_3to8_GL dec(A, B0, B1, B2, B3, B4, B5, B6, B7);

  initial 
    begin
	  clk = 1'b0;
      data_file = $fopen("/home/qil219/scripts/ECE201_proj1/decoder_input.dat", "rb");
    end

  always
    clk = #5 ~clk;

  always @(negedge clk)
    begin
      eof = #10 $feof(data_file);
      if(eof==0)
        $fscanf(data_file, "%b", A);
      else
        begin
          $fclose(data_file);
          $finish;
        end
    end
 
endmodule