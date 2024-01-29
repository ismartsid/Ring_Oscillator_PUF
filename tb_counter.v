module tb_counter;

wire Response;
wire [3:0] out1,out2;
reg [3:0]Sel0,Sel1;
reg [15:0]RO_out;
reg reset;
reg response;
integer i,j;
 
counter dut( .Sel0(Sel0), .Sel1(Sel1), .RO_out(RO_out), .reset(reset),.response(response),.out1(out1),.out2(out2));

 initial begin
 reset = 1;
 #5;
 reset = 0;
 RO_out = 16'b0;
 #10;
 reset = 1;
 #5;
 Sel0 = 4'b1100; 
 Sel1 = 4'b1000;
 end
 
 initial begin
 #25;
 for (i=0; i<200;i=i+1) begin
 RO_out[12] = ~RO_out[12];

 #15;
 end
 end
 
 initial begin
 #25;
 for (j=0; j<200;j=j+1) begin
 RO_out[8] = ~RO_out[8];

 #12;
 end
 end
 
 
endmodule
