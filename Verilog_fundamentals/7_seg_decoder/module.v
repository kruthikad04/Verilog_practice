// Module: seven_seg_decoder
// Description: Dataflow implementation of a 4-bit Hex to 7-segment decoder (Common Cathode)
module seven_seg_decoder (
    input [3:0] hex_val,     // 4-bit input (0x0 to 0xF)
    output [6:0] seg         // 7-bit output representing segments {a, b, c, d, e, f, g}
);

    // Segment mapping format: {a, b, c, d, e, f, g}
    // 1 = segment ON, 0 = segment OFF (Common Cathode)
    assign seg = (hex_val == 4'h0) ? 7'b1111110 : // 0
                 (hex_val == 4'h1) ? 7'b0110000 : // 1
                 (hex_val == 4'h2) ? 7'b1101101 : // 2
                 (hex_val == 4'h3) ? 7'b1111001 : // 3
                 (hex_val == 4'h4) ? 7'b0110011 : // 4
                 (hex_val == 4'h5) ? 7'b1011011 : // 5
                 (hex_val == 4'h6) ? 7'b1011111 : // 6
                 (hex_val == 4'h7) ? 7'b1110000 : // 7
                 (hex_val == 4'h8) ? 7'b1111111 : // 8
                 (hex_val == 4'h9) ? 7'b1111011 : // 9
                 (hex_val == 4'hA) ? 7'b1110111 : // A
                 (hex_val == 4'hB) ? 7'b0011111 : // b
                 (hex_val == 4'hC) ? 7'b1001110 : // C
                 (hex_val == 4'hD) ? 7'b0111101 : // d
                 (hex_val == 4'hE) ? 7'b1001111 : // E
                 (hex_val == 4'hF) ? 7'b1000111 : // F
                                     7'b0000000;  // Default Off

endmodule
