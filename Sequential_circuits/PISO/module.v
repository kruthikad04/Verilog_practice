module piso (
    input  wire       clk,
    input  wire       reset,
    input  wire       load,
    input  wire [3:0] d,
    output wire       serial_out
);

reg [3:0] q;

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else if (load)
        q <= d;
    else
        q <= {q[2:0], 1'b0};
end

assign serial_out = q[3];

endmodule