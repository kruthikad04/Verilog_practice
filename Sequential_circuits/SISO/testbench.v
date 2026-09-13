`timescale 1ns/1ps

module tb_siso;

reg clk;
reg reset;
reg serial_in;
wire serial_out;

siso uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .serial_out(serial_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("siso.vcd");
    $dumpvars(0, tb_siso);

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