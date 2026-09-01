module half_subtractor (
    input  wire a,b,output wire diff,borrow);

    // Continuous assignments for dataflow abstraction
    assign diff   = a ^ b;
    assign borrow = ~a & b;

endmodule
