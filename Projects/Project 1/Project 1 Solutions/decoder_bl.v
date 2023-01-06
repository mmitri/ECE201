
module decoder_3to8_BL(A, B0, B1, B2, B3, B4, B5, B6, B7);
  
  input [2:0] A;
  output reg B0, B1, B2, B3, B4, B5, B6, B7;
  
  always @ (A)
    begin 
      B0 = 0; B1 = 0; B2 = 0; B3 = 0; B4 = 0; B5 = 0; B6 = 0; B7 = 0;
      case(A)
        3'b000: B0 = 1'b1;
        3'b001: B1 = 1'b1;
        3'b010: B2 = 1'b1;
        3'b011: B3 = 1'b1;
        3'b100: B4 = 1'b1;
        3'b101: B5 = 1'b1;
        3'b110: B6 = 1'b1;
        3'b111: B7 = 1'b1;
      endcase
    end
endmodule


module decoder_3to8_BL_test();
  reg [2:0] A;
  wire B0, B1, B2, B3, B4, B5, B6, B7;
  
  decoder_3to8_BL dec(A, B0, B1, B2, B3, B4, B5, B6, B7);
  
  initial 
    begin 
      A[2:0] = 3'b000;
      #10 A[2:0] = 3'b001;
      #10 A[2:0] = 3'b010;
      #10 A[2:0] = 3'b011;
      #10 A[2:0] = 3'b100;
      #10 A[2:0] = 3'b101;
      #10 A[2:0] = 3'b110; 
      #10 A[2:0] = 3'b111;
	  #10;
    end
 
endmodule