module xnor_gate (
    input wire a, b, output wire out);

    // Continuous assignment using bitwise XNOR operator (~^)
    assign out = a ~^ b;

endmodule
