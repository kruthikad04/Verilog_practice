module t_flipflop (
    input  wire T,
    input  wire CLK,
    output reg  Q
);

always @(posedge CLK) begin

    if (T == 1'b0)
        Q <= Q;       // HOLD

    else
        Q <= ~Q;      // TOGGLE

end

endmodule