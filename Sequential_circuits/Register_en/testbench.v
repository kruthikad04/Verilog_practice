`timescale 1ns/1ps

module register_enable_tb;

reg clk;
reg en;
reg [7:0] d;
wire [7:0] q;

register_enable uut (
    .clk(clk),
    .en(en),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $dumpfile("register_enable.vcd");
    $dumpvars(0, register_enable_tb);

    clk = 0;
    en = 0;
    d = 8'b00000000;

    // Enable = 0, register does not change
    #10 d = 8'b10101010;

    // Enable = 1, register stores data
    #10 en = 1;
        d = 8'b10101010;

    #10 d = 8'b11001100;

    #10 d = 8'b11110000;

    // Disable
    #10 en = 0;
        d = 8'b00001111;

    // Enable again
    #10 en = 1;
        d = 8'b11111111;

    #10 $finish;

end

endmodule