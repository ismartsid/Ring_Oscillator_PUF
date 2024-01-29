`timescale 1ns / 1ps
module tb_RO;
 reg en, out;
 ring_osc dut(.Enable(en),.RO_out(out));
  
 initial begin
 en = 0;
 #100;
 en = 1;
 #1000 $finish;
 end
endmodule
