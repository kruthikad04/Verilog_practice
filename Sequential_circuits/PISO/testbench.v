`timescale 1ns/1ps

module tb_piso;

reg clk;
reg reset;
reg load;
reg [3:0] d;
wire serial_out;

piso uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .d(d),
    .serial_out(serial_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("piso.vcd");
    $dumpvars(0, tb_piso);

    // Initial values
    clk = 0;
    reset = 1;
    load = 0;
    d = 4'b0000;

    // Release reset
    #10 reset = 0;

    // Parallel load 1011
    #2 d = 4'b1011;
    load = 1;

    // Disable load and start shifting
    #10 load = 0;

    // Wait for all bits to shift out
    #40;

    $finish;

end

endmodule