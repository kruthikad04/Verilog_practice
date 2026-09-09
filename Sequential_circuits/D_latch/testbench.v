`timescale 1ns/1ps

module tb_d_latch;

    reg D;
    reg EN;

    wire Q;
    wire Qbar;

    // Instantiate D latch
    d_latch uut (
        .D(D),
        .EN(EN),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin

        // GTKWave waveform
        $dumpfile("d_latch.vcd");
        $dumpvars(0, tb_d_latch);

        $monitor("Time=%0t | EN=%b D=%b | Q=%b Qbar=%b",
                 $time, EN, D, Q, Qbar);

        // Initially disabled
        EN = 0;
        D  = 0;

        #10;

        // Enable latch
        EN = 1;
        D  = 0;

        #10;

        // D changes while enabled
        D = 1;

        #10;

        D = 0;

        #10;

        // Disable latch
        EN = 0;
        D  = 1;

        #10;

        // D changes while disabled
        D = 0;

        #10;

        $finish;

    end

endmodule