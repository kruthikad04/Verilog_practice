`timescale 1ns/1ps

module mux4to1_tb;

    reg  [3:0] I;
    reg  [1:0] S;

    wire Y;

    // Instantiate DUT
    mux4to1 uut (
        .I(I),
        .S(S),
        .Y(Y)
    );

    initial begin

        // Create waveform
        $dumpfile("mux4to1.vcd");
        $dumpvars(0, mux4to1_tb);

        $monitor("Time=%0t | I=%b | S=%b | Y=%b",
                 $time, I, S, Y);

        // Input = 1010
        I = 4'b1010;

        // Select I0
        S = 2'b00;
        #10;

        // Select I1
        S = 2'b01;
        #10;

        // Select I2
        S = 2'b10;
        #10;

        // Select I3
        S = 2'b11;
        #10;


        // Change input pattern
        I = 4'b1101;

        // Select I0
        S = 2'b00;
        #10;

        // Select I1
        S = 2'b01;
        #10;

        // Select I2
        S = 2'b10;
        #10;

        // Select I3
        S = 2'b11;
        #10;

        $finish;

    end

endmodule