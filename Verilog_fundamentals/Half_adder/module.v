// Half Adder using Dataflow Modeling
module half_adder (
    input wire a, b,output wire sum,carry);

    // Continuous assignments for boolean logic
    assign sum   = a ^ b;  // XOR gate logic
    assign carry = a & b;  // AND gate logic

endmodule
