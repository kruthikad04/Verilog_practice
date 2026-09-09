module d_latch (
    input  wire D,
    input  wire EN,
    output reg  Q,
    output reg  Qbar
);

always @(*) begin

    if (EN == 1'b1) begin
        Q    = D;
        Qbar = ~D;
    end

end

endmodule