module d_flipflop (
    input  wire D,
    input  wire CLK,
    output reg  Q,
    output reg Qbar
);

always @(posedge CLK) begin

    Q    <= D;
    Qbar <= ~D;

end

endmodule