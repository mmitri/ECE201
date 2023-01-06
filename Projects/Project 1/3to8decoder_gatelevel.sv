// Mark Mitri
// ECE201
// Project 1
// 3 to 8 Decoder gate level

module threeto8decoder_gatelevel(input s0,input s1,input s2, output [7:0] dOut);

  assign dOut[0]=and(~s0,~s1,~s2);
  assign dOut[1]=and(~s0,~s1,s2);
  assign dOut[2]=and(~s0,s1,~s2);
  assign dOut[3]=and(~s0,s1,s2);
  assign dOut[4]=and(s0,~s1,s2);
  assign dOut[5]=and(s0,~s1,s2);
  assign dOut[6]=and(s0,s1,~s2);
  assign dOut[7]=and(s0,s1,s2);

endmodule