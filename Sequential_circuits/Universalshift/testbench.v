`timescale 1ns/1ps

module tb_universal_shift_register;

reg clk;
reg reset;
reg s1;
reg s0;
reg serial_left;
reg serial_right;
reg [3:0] parallel_in;

wire [3:0] q;

universal_shift_register uut (
    .clk(clk),
    .reset(reset),
    .s1(s1),
    .s0(s0),
    .serial_left(serial_left),
    .serial_right(serial_right),
    .parallel_in(parallel_in),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0, tb_universal_shift_register);

    // Initial values
    clk = 0;
    reset = 1;
    s1 = 0;
    s0 = 0;
    serial_left = 0;
    serial_right = 0;
    parallel_in = 4'b0000;

    // Release reset
    #10 reset = 0;

    // --------------------------------
    // Parallel Load
    // --------------------------------
    #2;
    parallel_in = 4'b1011;
    s1 = 1;
    s0 = 1;

    #10;

    // --------------------------------
    // Hold
    // --------------------------------
    s1 = 0;
    s0 = 0;

    #10;

    // --------------------------------
    // Shift Right
    // --------------------------------
    serial_right = 1;
    s1 = 0;
    s0 = 1;

    #10;

    // Shift Right again
    serial_right = 0;

    #10;

    // --------------------------------
    // Parallel Load again
    // --------------------------------
    parallel_in = 4'b1100;
    s1 = 1;
    s0 = 1;

    #10;

    // --------------------------------
    // Shift Left
    // --------------------------------
    serial_left = 1;
    s1 = 1;
    s0 = 0;

    #10;

    // Shift Left again
    serial_left = 0;

    #10;

    $finish;

end

endmodule