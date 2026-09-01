module mux_2x1 (input wire i0,i1,s,output wire y);
    assign y = s ? i1 : i0;

endmodule
