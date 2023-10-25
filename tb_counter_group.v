module tb_counter;

wire Response;
wire [3:0] out1,out2;
reg [3:0]Cha0,Cha1;
reg [15:0]RO_out;
reg reset;
integer i,j;
Counter_group dut( .Cha0(Cha0), .Cha1(Cha1), .RO_out(RO_out), .reset(reset),.Response(Response),.out1(out1),.out2(out2));

 initial begin
 reset = 1;
 #5;
 reset = 0;
 RO_out = 16'b0;
 #10;
 reset = 1;
 #5;
 Cha0 = 4'b1100; 
 Cha1 = 4'b1000;
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
