// Mark Mitri
// ECE201 Project 1
// Part 1
// 3-8 decoder behavioral

module threeTo8decoder_behavioral(dIn,dOut);
  	input [2:0] dIn;
    output reg [7:0] dOut;

always @(dIn) begin
    case (dIn)
        3'b000 : dOut = 8'b00000001;
        3'b001 : dOut = 8'b00000010;
        3'b010 : dOut = 8'b00000100;
        3'b011 : dOut = 8'b00001000;
        3'b100 : dOut = 8'b00010000;
        3'b101 : dOut = 8'b00100000;
        3'b110 : dOut = 8'b01000000;
        3'b111 : dOut = 8'b10000000;
        default : dOut = 8'b00000000; 
    endcase
endmodule