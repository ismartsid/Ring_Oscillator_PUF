module PUF #(parameter RO_modules = 16, CounterGroups = 4)(
  input reset, //Reset
  input  [3:0] Sel0, //select lines for mux
  input  [3:0] Sel1, //select lines for mux
  output [3:0] response // output from comparator
);

  (* keep *) wire [63:0] RO_wire;

genvar j;
generate // replicating counter groups
    for(j=0;j<CounterGroups;j = j +1 )begin : counter_generate
      (* keep *) counter counter_inst(.Sel0(Sel0), .Sel1(Sel1), .RO_out(RO_wire[(j*16)+15:j*16]), .reset(reset), .response(response[j]));
        end
endgenerate

genvar i;
generate // replicating ro modules
    for(i=0; i<RO_modules*CounterGroups; i = i + 1)begin : ro_generate
       (* keep *) ring_osc ring_osc_inst(.Enable(~reset),.RO_out(RO_wire[i]));
    end 
endgenerate
endmodule

