module magnitude_comparator (
    input  wire [3:0] A,
    input  wire [3:0] B,

    output reg        A_greater,
    output reg        A_equal,
    output reg        A_less
);

always @(*) begin

    // Default values
    A_greater = 1'b0;
    A_equal   = 1'b0;
    A_less    = 1'b0;

    if (A > B)
        A_greater = 1'b1;

    else if (A == B)
        A_equal = 1'b1;

    else
        A_less = 1'b1;

end

endmodule