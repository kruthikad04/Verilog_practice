module bcd_excess3 (
    input  wire [3:0] bcd,
    output reg  [3:0] excess3
);

always @(*) begin

    case (bcd)

        4'b0000: excess3 = 4'b0011; // 0 -> 3
        4'b0001: excess3 = 4'b0100; // 1 -> 4
        4'b0010: excess3 = 4'b0101; // 2 -> 5
        4'b0011: excess3 = 4'b0110; // 3 -> 6
        4'b0100: excess3 = 4'b0111; // 4 -> 7
        4'b0101: excess3 = 4'b1000; // 5 -> 8
        4'b0110: excess3 = 4'b1001; // 6 -> 9
        4'b0111: excess3 = 4'b1010; // 7 -> 10
        4'b1000: excess3 = 4'b1011; // 8 -> 11
        4'b1001: excess3 = 4'b1100; // 9 -> 12

        // Invalid BCD inputs: 10-15
        default: excess3 = 4'bxxxx;

    endcase

end

endmodule