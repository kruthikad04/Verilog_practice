`timescale 1ns/1ps

module encoder_tb;

    reg  [3:0] D;
    wire [1:0] Y;

    // Instantiate DUT
    encoder uut (
        .D(D),
        .Y(Y)
    );

    initial begin

        // Create waveform
        $dumpfile("encoder.vcd");
        $dumpvars(0, encoder_tb);

        $monitor("Time=%0t | D=%b | Y=%b",
                 $time, D, Y);

        // D0 = 1
        D = 4'b0001;
        #10;

        // D1 = 1
        D = 4'b0010;
        #10;

        // D2 = 1
        D = 4'b0100;
        #10;

        // D3 = 1
        D = 4'b1000;
        #10;

        // Invalid input: no input is HIGH
        D = 4'b0000;
        #10;

        // Invalid input: more than one input is HIGH
        D = 4'b0011;
        #10;

        $finish;

    end

endmodule