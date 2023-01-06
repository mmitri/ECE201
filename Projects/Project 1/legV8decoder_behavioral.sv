// Mark Mitri
// ECE 201 Project 1
// Part 2
// 32bit LEGv8 Decoder

/*
Outputs: AND, ADD, ORR, ADDS, EOR, SUB, LSR,
		 LSL, BR, ANDS, SUBS, ORRI, EORI, ADDI
         ANDI, ADDIS, SUBI, SUBIS, ANDIS, B, BL

* From Computer Organization and Design Textbook: Fig. 2.20
Instruction 	Opcode        Opcode Size   Instruction Format
AND				10001010000   11            R-Format
ADD				10001011000   11			R-Format
ORR				10101010000	  11			R-Format
ADDS			10101011000	  11			R-Format
EOR				11101010000	  11			R-Format
SUB				11001011000	  11			R-Format
LSR				11010011010	  11			R-Format
LSL				11010011011	  11			R-Format
BR				11010110000	  11			R-Format
ANDS			11101010000	  11			R-Format
SUBS			11101011000   11			R-Format
ORRI			1011001000	  10			I-Format
EORI			1101001000    10			I-Format
ADDI			1001000100	  10			I-Format
ANDI			1001001000	  10			I-Format
ADDIS			1011000100    10			I-Format
SUBI			1101000100	  10			I-Format
SUBIS			1111000100    10			I-Format
ANDIS			1111001000	  10			I-Format
B				000101		  06			B-Format
BL				100101		  06			B-Format
*/

module legV8decoder(bus, instruction);
  input [31:0] bus;
  input opcodeSix = [31:25] bus;
  input opcodeEleven = [31:20] bus;
  output reg [7:0] instruction;
  
  if(//opcode length == 6)
    // always block for opcode length 6 instructions
    always @(bus) 
      begin
  		case(bus)
          6'b000101:instruction = 6'b000001; // Instruction = B
          6'b100101:instruction = 6'b000010; // Instruction = BL
          default:instruction = 6'b000000;
        endcase
    else if(//opcode length == 10)
      begin
      // always block for opcode length 10 instructions
      always @(bus) begin
        case(bus)
          10'b1011001000:instruction = 6'b000011; // Instruction = ORRI
          10'b1101001000:instruction = 6'b000100; // Instruction = EORI
          10'b1001000100:instruction = 6'b000101; // Instruction = ADDI
          10'b1001001000:instruction = 6'b000110; // Instruction = ANDI
          10'b1011000100:instruction = 6'b000111; // Instruction = ADDIS
          10'b1101000100:instruction = 6'b001000; // Instruction = SUBI
          10'b1111000100:instruction = 6'b001001; // Instruction = SUBIS
          10'b1111001000:instruction = 6'b001010; // Instruction = ANDIS
          default:instruction = 6'b000000;
        endcase
    else if(//opcode length == 11) 
      begin
      // always block for opcode length 11 instructions
      always @(bus) begin
        case(bus)
          11'b10001010000:instruction = 6'b001011; // Instruction = AND
          11'b10001011000:instruction = 6'b001100; // Instruction = ADD
          11'b10101010000:instruction = 6'b001101; // Instruction = ORR
          11'b10101011000:instruction = 6'b001110; // Instruction = ADDS
          11'b11101010000:instruction = 6'b001111; // Instruction = EOR
          11'b11001011000:instruction = 6'b010000; // Instruction = SUB
          11'b11010011010:instruction = 6'b010001; // Instruction = LSR
          11'b11010011011:instruction = 6'b010010; // Instruction = LSL
          11'b11010110000:instruction = 6'b010011; // Instruction = BR
          11'b11101010000:instruction = 6'b010100; // Instruction = ANDS
          11'b11101011000:instruction = 6'b010101; // Instruction = SUBS
          default: instruction = 6'b000000;
        endcase
      end else
endmodule
      
    
          
          
  
      
    
	