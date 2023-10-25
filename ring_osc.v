module ring_osc #(
    parameter INVERTERS_PER_RING=6, // must be an even number; number of inverters + 1
    parameter INVERTER_DELAY=2 //delay of each inverter
)(
input Enable, //enable signal
output RO_out //output
);

    (* keep *) wire [INVERTERS_PER_RING-1:0] wires; // To optimize the hardware, Synthesize tools create only one inverter, using 'KEEP' to bypass this
    assign RO_out = wires[INVERTERS_PER_RING-1];

    genvar i; //generate block is used to replicate the inverters
    generate
        for(i=0; i<INVERTERS_PER_RING; i=i+1) begin : true_block
            if (i == 0)//(* keep = "true" *)
              (* keep *) nand f(wires[i],Enable,wires[INVERTERS_PER_RING-2]);
            else 
              (* keep *) not #(INVERTER_DELAY) g (wires[i], wires[i-1]);
        end
    endgenerate
endmodule
