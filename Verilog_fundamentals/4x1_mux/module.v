// 4:1 Multiplexer - Dataflow Modeling Style
module mux4to1_dataflow (
    input [3:0] in,       // 4-bit data input (in[0], in[1], in[2], in[3])
    input [1:0] sel,      // 2-bit select lines (sel[0], sel[1])
    output out            // Single bit scalar output
);

    // Continuous assignment using ternary operator to select inputs
    assign out = (sel == 2'b00) ? in[0] :
                 (sel == 2'b01) ? in[1] :
                 (sel == 2'b10) ? in[2] : in[3];

endmodule
