module jk_flipflop (
    input  wire J,
    input  wire K,
    input  wire CLK,
    output reg Q,
    output reg Qbar
);

always @(posedge CLK) begin

    case ({J, K})

        2'b00: begin
            Q <= Q;       // HOLD
        end

        2'b01: begin
            Q <= 1'b0;    // RESET
        end

        2'b10: begin
            Q <= 1'b1;    // SET
        end

        2'b11: begin
            Q <= ~Q;      // TOGGLE
        end

    endcase

    Qbar <= ~Q;

end

endmodule