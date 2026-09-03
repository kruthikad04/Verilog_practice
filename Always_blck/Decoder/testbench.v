`timescale 1ns/1ps

module decoder_tb;

    reg  [1:0] A;
    wire [3:0] Y;

    // Instantiate DUT
    decoder uut (
        .A(A),
        .Y(Y)
    );

    initial begin

        // Create waveform
        $dumpfile("decoder.vcd");
        $dumpvars(0, decoder_tb);

        $monitor("Time=%0t | A=%b | Y=%b",
                 $time, A, Y);

        // Test 00
        A = 2'b00;
        #10;

        // Test 01
        A = 2'b01;
        #10;

        // Test 10
        A = 2'b10;
        #10;

        // Test 11
        A = 2'b11;
        #10;

        $finish;

    end

endmodule