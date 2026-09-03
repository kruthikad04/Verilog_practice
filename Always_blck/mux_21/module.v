module mux2to1 (input in0, in1, sel,output reg  out);
    always @(*) begin
        if (sel) begin
            out = in1;
        end else begin
            out = in0;
        end
    end

endmodule