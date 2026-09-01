module nor_gate (
    input wire a,b,
    output wire out
);
 // Continuous assignment using bitwise OR and NOT operators
    assign out = ~(a | b);

endmodule
