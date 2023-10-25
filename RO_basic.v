module RO_basic #(
    parameter INVERTERS_PER_RING=6, // must be an even number
    parameter INVERTER_DELAY=2
)(
input Enable,
output RO_out
);

    (* keep *) wire [INVERTERS_PER_RING-1:0] wires;
    assign RO_out = wires[INVERTERS_PER_RING-1];

    genvar i;
    generate
        for(i=0; i<INVERTERS_PER_RING; i=i+1) begin : true_block
            if (i == 0)//(* keep = "true" *)
              (* keep *) nand f(wires[i],Enable,wires[INVERTERS_PER_RING-2]);
            else 
              (* keep *) not #(INVERTER_DELAY) g (wires[i], wires[i-1]);
        end
    endgenerate
endmodule
