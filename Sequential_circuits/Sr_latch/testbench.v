`timescale 1ns/1ps

module tb_sr_latch;

    reg S;
    reg R;

    wire Q;
    wire Qbar;

    sr_latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin

        // Create waveform file
        $dumpfile("sr_latch.vcd");
        $dumpvars(0, tb_sr_latch);

        // Display values
        $monitor("Time=%0t | S=%b R=%b | Q=%b Qbar=%b",
                 $time, S, R, Q, Qbar);

        // Initial
        S = 0;
        R = 0;

        #10;

        // SET
        S = 1;
        R = 0;

        #10;

        // HOLD
        S = 0;
        R = 0;

        #10;

        // RESET
        S = 0;
        R = 1;

        #10;

        // HOLD
        S = 0;
        R = 0;

        #10;

        // INVALID
        S = 1;
        R = 1;

        #10;

        $finish;

    end

endmodule