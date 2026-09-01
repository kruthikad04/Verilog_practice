module comparator_4bit_dataflow (
    input  [3:0] A,
    input  [3:0] B,
    output       A_gt_B,
    output       A_lt_B,
    output       A_eq_B
);

    // Continuous assignment using logical operators
    assign A_gt_B = (A > B) ? 1'b1 : 1'b0;
    assign A_lt_B = (A < B) ? 1'b1 : 1'b0;
    assign A_eq_B = (A == B) ? 1'b1 : 1'b0;

endmodule
