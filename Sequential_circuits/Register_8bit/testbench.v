`timescale 1ns/1ps

module register8_tb;

reg clk;
reg [7:0] d;
wire [7:0] q;

register8 uut (
    .clk(clk),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    // GTKWave
    $dumpfile("register8.vcd");
    $dumpvars(0, register8_tb);

    clk = 0;
    d = 8'b00000000;

    #10 d = 8'b10101010;
    #10 d = 8'b11001100;
    #10 d = 8'b11110000;
    #10 d = 8'b00001111;
    #10 d = 8'b11111111;

    #10 $finish;

end

endmodule