// Mark Mitri
// ECE201 Project 1
// 3 to 8 decoder gate level
// testbench

module threeto8decoder_gatelevel_testbench;
  reg s0;
  reg s1;
  reg s2;
  wire [7:0] dOut;
  
  threeto8decoder_gatelevel uut ( .s0(s0),.s1(s1),.s2(s2),.dOut(dOut) );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    s0=1'b0;s1=1'b0;s2=1'b0;
    #100 s0=1'b0;s1=1'b0;s2=1'b0;
    #100 s0=1'b0;s1=1'b0;s2=1'b1;
    #100 s0=1'b0;s1=1'b1;s2=1'b0;
    #100 s0=1'b0;s1=1'b1;s2=1'b1;
    #100 s0=1'b1;s1=1'b0;s2=1'b0;
    #100 s0=1'b1;s1=1'b0;s2=1'b1;
    #100 s0=1'b1;s1=1'b1;s2=1'b0;
    #100 s0=1'b1;s1=1'b1;s2=1'b1;
    #100 $stop;
  end
  
  initial begin
    $monitor ("%t | s0 = %d| s1 = %d| s2 = %d| dOut = %d", $time, s0, s1, s2, dOut);
    $dumpfile("dump.vcd");
    $dumpvars(1);
	end
endmodule