module sr_latch (
    input  wire S,
    input  wire R,
    output reg  Q,
    output reg Qbar
);

always @(*) begin

    if (S == 1'b1 && R == 1'b0) begin
        Q    = 1'b1;
        Qbar = 1'b0;
    end

    else if (S == 1'b0 && R == 1'b1) begin
        Q    = 1'b0;
        Qbar = 1'b1;
    end

    else if (S == 1'b0 && R == 1'b0) begin
        // HOLD previous state
        Q    = Q;
        Qbar = Qbar;
    end

    else begin
        // Invalid condition
        Q    = 1'bx;
        Qbar = 1'bx;
    end

end

endmodule