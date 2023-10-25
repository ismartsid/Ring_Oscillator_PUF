`timescale 1ns / 1ps

module counter #(parameter COUNTER_BITS = 4, MAX_VALUE = (2**COUNTER_BITS)-1) //  Counter_bits represents the bit width of the counter, determining its maximum count capacity
  ( 
                input [3:0] Sel0, //select lines for mux
                input [3:0] Sel1, //select lines for mux
                input [15:0] RO_out, //input to mux from RO blocks
                input reset, //Reset
                output reg response // output from comparator
 );
 
reg[COUNTER_BITS-1:0] out1, out2;
wire cnt1,cnt2;
  
  always @(posedge cnt1 or negedge reset) begin //Counter-1
    if(!reset) begin
        out1 <= 0;
        end
    else begin
        out1 <= out1 + 1;
        end
   end
   
  always @(posedge cnt2 or negedge reset) begin //Counter-2
    if(!reset) begin
        out2 <= 0;
        end
    else begin
        out2 <= out2 + 1;
        end
   end

  Mux16to1 a(.out(cnt1), .in(RO_out), .sel(Sel0));
  Mux16to1 b(.out(cnt2), .in(RO_out), .sel(Sel1));

  always @(*) begin // Comparator 
    if (out1 == MAX_VALUE && out2 != MAX_VALUE)
        response = 1'b0;  
    else if (out2 == MAX_VALUE && out1 != MAX_VALUE)
        response = 1'b1;
    else
        response = 1'bx;   
end
endmodule


module Mux4to1(output out, input [3:0] in, input [1:0] sel);
    assign  out = sel[1] ? (sel[0] ? in[3] : in[2]) : (sel[0] ? in[1] : in[0]); 
    // if s1 is high, then evaluate first s0 block
    // if s1 is low, evaluate second s0 block
    // second "nested" ternary operation decides which input is high and passes
    // it along to output.
endmodule

module Mux16to1 (output out, input [15:0] in, input [3:0] sel);
wire [4:1] k;

   Mux4to1 mux0(k[1], in[3:0], sel[1:0]);
   Mux4to1 mux1(k[2], in[7:4], sel[1:0]);
   Mux4to1 mux2(k[3], in[11:8], sel[1:0]);
   Mux4to1 mux3(k[4], in[15:12], sel[1:0]);
   Mux4to1 mux4(out, k[4:1], sel[3:2]); // overall 16to1mux output

endmodule

