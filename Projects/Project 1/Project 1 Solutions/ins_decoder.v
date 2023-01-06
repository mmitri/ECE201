module ins_decoder(Bus, AND, ADD, ORR, ADDS, EOR, SUB, LSR, LSL, BR, ANDS, SUBS, ORRI, EORI, ADDI, ANDI, ADDIS, SUBI, SUBIS, ANDIS, B, BL);
  
  input [31:0] Bus;
  output reg AND, ADD, ORR, ADDS, EOR, SUB, LSR, LSL, BR, ANDS, SUBS, ORRI, EORI, ADDI, ANDI, ADDIS, SUBI, SUBIS, ANDIS, B, BL;
  
  // ? is a wildcard character that can be substituted for 0 or 1.
  always @ (Bus)
    begin 
      AND = 0; ADD = 0; ORR = 0; ADDS = 0; EOR = 0; SUB = 0; LSR = 0; LSL = 0; BR = 0; ANDS = 0; SUBS = 0; ORRI = 0; EORI = 0; ADDI = 0; ANDI = 0; ADDIS = 0; SUBI = 0; SUBIS = 0; ANDIS = 0; B = 0; BL = 0;
      case(Bus[31:21]) 
        11'b000101?????: B = 1'b1;
        11'b100101?????: BL = 1'b1;	 
        11'b1011001000?: ORRI = 1'b1;
        11'b1101001000?: EORI = 1'b1;
        11'b1001000100?: ADDI = 1'b1;
        11'b1001001000?: ANDI = 1'b1;
        11'b1011000100?: ADDIS = 1'b1;
        11'b1101000100?: SUBI = 1'b1;
        11'b1111000100?: SUBIS = 1'b1;
        11'b1111001000?: ANDIS = 1'b1;		
        11'b10001011000: ADD = 1'b1;
        11'b10001010000: AND = 1'b1;
        11'b10101010000: ORR = 1'b1;
        11'b10101011000: ADDS = 1'b1;
        11'b11001010000: EOR = 1'b1;
        11'b11001011000: SUB = 1'b1;
        11'b11010011010: LSR = 1'b1;
        11'b11010011011: LSL = 1'b1;
        11'b11010110000: BR = 1'b1;
        11'b11101010000: ANDS = 1'b1;
        11'b11101011000: SUBS = 1'b1;		
        default: 
          ADD = 1'b1; 	   			
      endcase
    end
  						
endmodule

module ins_decoder_test();
  
  reg [31:0] Bus;
  wire AND, ADD, ORR, ADDS, EOR, SUB, LSR, LSL, BR, ANDS, SUBS, ORRI, EORI, ADDI, ANDI, ADDIS, SUBI, SUBIS, ANDIS, B, BL;
  reg clk;
  reg eof;  
  integer data_file; 
  
  ins_decoder dec(Bus, AND, ADD, ORR, ADDS, EOR, SUB, LSR, LSL, BR, ANDS, SUBS, ORRI, EORI, ADDI, ANDI, ADDIS, SUBI, SUBIS, ANDIS, B, BL);

  initial 
    begin
	  clk = 1'b0;
      data_file = $fopen("/home/qil219/scripts/ECE201_proj1/ins_decoder_input.dat", "rb");
    end

  always
    clk = #5 ~clk;

  always @(negedge clk)
    begin
      eof = #10 $feof(data_file);
      if(eof==0)
        $fscanf(data_file, "%b", Bus);
      else
        begin
          $fclose(data_file);
          $finish;
        end
    end
 
endmodule