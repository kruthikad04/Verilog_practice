// full_subtractor.v
module full_subtractor (
    input  wire a,      // Minuend
    input  wire b,      // Subtrahend
    input  wire bin,    // Borrow-in
    output wire diff,   // Difference
    output wire bout    // Borrow-out
);

    // Continuous assignment statements for dataflow modeling
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (~(a ^ b) & bin);

endmodule
