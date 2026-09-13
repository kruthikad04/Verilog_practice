`timescale 1ns/1ps

module tb_shift_register;

reg clk;
reg reset;
reg serial_in;
wire [3:0] q;

shift_register uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("shift_register.vcd");
    $dumpvars(0, tb_shift_register);

    // Initial values
    clk = 0;
    reset = 1;
    serial_in = 0;

    // Release reset
    #10 reset = 0;

    // Send 1
    #2 serial_in = 1;

    // Send 0
    #10 serial_in = 0;

    // Send 1
    #10 serial_in = 1;

    // Send 1
    #10 serial_in = 1;

    // Send 0
    #10 serial_in = 0;

    #10 $finish;

end

endmodule