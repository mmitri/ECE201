// Mark Mitri
// ECE201 Project 1
// Part 1
// 3-8 decorder behavioral
// testbench

module threeTo8decoder_behavioral_tb;
  	reg [2:0] dIn;
  	wire [7:0] dOut;
  
  	threeTo8decoder_behavioral uut (.dIn(dIn), .dOut(dOut));
  
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      	dIn = 0; #100;
        dIn = 3'b000; #100;
        dIn = 3'b001; #100;
        dIn = 3'b010; #100;
        dIn = 3'b011; #100;
        dIn = 3'b100; #100;
        dIn = 3'b101; #100;
        dIn = 3'b110; #100;
        dIn = 3'b111; #100;
        #100 $stop;
    end
    
    initial begin
      $monitor ("%t | dIn = %d| dOut = %d", $time, dIn, dOut);
      $dumpfile("dump.vcd");
      $dumpvars(1);
	  end
endmodule