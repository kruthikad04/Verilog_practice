module xor_gate_df (
    input wire a, b,
    output wire out
);

    // Continuous assignment using the bitwise XOR operator (^)
    assign out = a ^ b;

endmodule
