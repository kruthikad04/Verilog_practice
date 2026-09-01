// 2-to-4 Decoder using Dataflow Modeling
module decoder_2to4 (
    input wire en,       // Enable pin (Active High)
    input wire [1:0] in, // 2-bit binary input selector
    output wire [3:0] out // 4-bit decoded output vector
);

    // Continuous assignment statements mapping decoder logic
    assign out[0] = en & (~in[1]) & (~in[0]);
    assign out[1] = en & (~in[1]) & (in[0]);
    assign out[2] = en & (in[1])  & (~in[0]);
    assign out[3] = en & (in[1])  & (in[0]);

endmodule
