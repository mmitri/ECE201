// Mark Mitri
// ECE 201 Project 1
// Part 2
// 32bit LEGv8 Decoder
// Testbench

module legV8decoder;
  reg [31:0] bus;
  reg [31:25] opcodeSix;
  reg [31:20] opcodeEleven;
  wire instruction;
  
  legV8decoder uut(.bus(bus), .opcodeSix(opcodeSix), .opcodeEleven(opcodeEleven), .instruction(instruction));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    
    
  end
endmodule