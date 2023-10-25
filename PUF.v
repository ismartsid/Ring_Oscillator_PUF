module PUF #(parameter RO_modules = 16, CounterGroups = 4)(
  input        reset,
  input  [3:0] Cha0,
  input  [3:0] Cha1,
  output [3:0] Response
);

(* keep *) wire [63:0] ROwire;

//Counter_group(.Cha0(Cha0), .Cha1(Cha1), .RO_out(ROwire[15:0]), .reset(reset), .Response(Response[0]));
//Counter_group(.Cha0(Cha0), .Cha1(Cha1), .RO_out(ROwire[31:16]), .reset(reset), .Response(Response[1]));
//Counter_group(.Cha0(Cha0), .Cha1(Cha1), .RO_out(ROwire[47:32]), .reset(reset), .Response(Response[2]));
//Counter_group(.Cha0(Cha0), .Cha1(Cha1), .RO_out(ROwire[63:48]), .reset(reset), .Response(Response[3]));

genvar j;

generate
    for(j=0;j<CounterGroups;j = j +1 )begin : counter_generate
       (* keep *) Counter_group Counter_group_inst(.Cha0(Cha0), .Cha1(Cha1), .RO_out(ROwire[(j*16)+15:j*16]), .reset(reset), .Response(Response[j]));
        end
endgenerate

genvar i;
generate
    for(i=0; i<RO_modules*CounterGroups; i = i + 1)begin : ro_generate
       (* keep *) RO_basic RO_basic_inst(.Enable(~reset),.RO_out(ROwire[i]));
    end 
endgenerate
endmodule

