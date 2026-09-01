module nand_gate (input wire a, b,output wire out);

    // Continuous assignment using bitwise AND and NOT operators
    assign out = ~(a & b);

endmodule
