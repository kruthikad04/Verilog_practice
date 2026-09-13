`timescale 1ns/1ps

module tb_pipo;

reg clk;
reg reset;
reg [3:0] d;
wire [3:0] q;

pipo uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("pipo.vcd");
    $dumpvars(0, tb_pipo);

    // Initial values
    clk = 0;
    reset = 1;
    d = 4'b0000;

    // Release reset
    #10 reset = 0;

    // Parallel input
    #2 d = 4'b1010;

    #10 d = 4'b1100;

    #10 d = 4'b0111;

    #10 d = 4'b1001;

    #10 $finish;

end

endmodule