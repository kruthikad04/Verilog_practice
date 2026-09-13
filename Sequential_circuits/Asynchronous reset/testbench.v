`timescale 1ns/1ps

module tb_async_reset;

reg clk;
reg reset;
reg [3:0] d;
wire [3:0] q;

async_reset uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("async_reset.vcd");
    $dumpvars(0, tb_async_reset);

    // Initial values
    clk = 0;
    reset = 0;
    d = 4'b0000;

    // Apply data
    #10 d = 4'b1010;
    #10 d = 4'b1100;

    // Assert asynchronous reset
    #3 reset = 1;

    // Keep reset HIGH for some time
    #7 reset = 0;

    // Apply new data
    #5 d = 4'b0110;

    #10 d = 4'b1111;

    #10 $finish;

end

endmodule