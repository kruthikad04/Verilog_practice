`timescale 1ns/1ps

module mux8to1_tb;

    reg  [7:0] I;
    reg  [2:0] S;

    wire Y;

    // Instantiate DUT
    mux8to1 uut (
        .I(I),
        .S(S),
        .Y(Y)
    );

    initial begin

        // Create waveform
        $dumpfile("mux8to1.vcd");
        $dumpvars(0, mux8to1_tb);

        $monitor("Time=%0t | I=%b | S=%b | Y=%b",
                 $time, I, S, Y);

        // Input pattern
        I = 8'b10110110;

        // Select I0
        S = 3'b000;
        #10;

        // Select I1
        S = 3'b001;
        #10;

        // Select I2
        S = 3'b010;
        #10;

        // Select I3
        S = 3'b011;
        #10;

        // Select I4
        S = 3'b100;
        #10;

        // Select I5
        S = 3'b101;
        #10;

        // Select I6
        S = 3'b110;
        #10;

        // Select I7
        S = 3'b111;
        #10;


        // Change input pattern
        I = 8'b11001001;

        S = 3'b000;
        #10;

        S = 3'b001;
        #10;

        S = 3'b010;
        #10;

        S = 3'b011;
        #10;

        S = 3'b100;
        #10;

        S = 3'b101;
        #10;

        S = 3'b110;
        #10;

        S = 3'b111;
        #10;

        $finish;

    end

endmodule