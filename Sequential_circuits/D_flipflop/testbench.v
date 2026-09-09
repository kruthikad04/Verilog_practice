`timescale 1ns/1ps

module tb_d_flipflop;

    reg D;
    reg CLK;

    wire Q;
    wire Qbar;

    // Instantiate D flip-flop
    d_flipflop uut (
        .D(D),
        .CLK(CLK),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    initial begin
        CLK = 0;

        forever #5 CLK = ~CLK;
    end

    // Test inputs
    initial begin

        // GTKWave waveform
        $dumpfile("d_flipflop.vcd");
        $dumpvars(0, tb_d_flipflop);

        $monitor("Time=%0t | CLK=%b D=%b | Q=%b Qbar=%b",
                 $time, CLK, D, Q, Qbar);

        // Initial D
        D = 0;

        #12;

        // D = 1
        D = 1;

        #10;

        // D = 0
        D = 0;

        #10;

        // D = 1
        D = 1;

        #10;

        // D = 0
        D = 0;

        #10;

        $finish;

    end

endmodule