module demux_1_4_dataflow (
    input din,
    input [1:0] sel,
    output y0,y1,y2,y3);

    assign y0 = din & (~sel[1]) & (~sel[0]);
    assign y1 = din & (~sel[1]) & (sel[0]);
    assign y2 = din & (sel[1]) & (~sel[0]);
    assign y3 = din & (sel[1]) & (sel[0]);

endmodule
