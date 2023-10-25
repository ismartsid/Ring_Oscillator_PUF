`timescale 1ns / 1ps
module tb_RO;
 reg en,out;
 RO_basic dut(.Enable(en),.RO_out(out));
  
 initial begin
 en = 0;
 #100;
 en = 1;
 end
endmodule
