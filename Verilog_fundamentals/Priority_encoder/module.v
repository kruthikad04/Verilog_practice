module priority_encoder_df (
    input wire [3:0] in,
    output wire [1:0] out,
    output wire idle
);

    // Idle is high only when all 4 input bits are zero
    assign idle = (in == 4'b0000);

    // Conditional dataflow nesting: highest bit (3) down to lowest bit (1)
    assign out = (in[3]) ? 2'b11 :
                 (in[2]) ? 2'b10 :
                 (in[1]) ? 2'b01 : 2'b00;

endmodule
