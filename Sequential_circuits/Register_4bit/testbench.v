`timescale 1ns/1ps

module register_tb;

reg clk;
reg reset;
reg [3:0] d;
wire [3:0] q;

register uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    // Create waveform
    $dumpfile("register.vcd");
    $dumpvars(0, register_tb);

    // Initial values
    clk = 0;
    reset = 1;
    d = 4'b0000;

    // Reset
    #10;
    reset = 0;

    // Apply data
    #10 d = 4'b1010;

    #10 d = 4'b1100;

    #10 d = 4'b0011;

    #10 d = 4'b1111;

    #10;

    $finish;
end

endmodule