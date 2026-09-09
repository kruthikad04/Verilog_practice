`timescale 1ns/1ps

module tb_jk_flipflop;

    reg J;
    reg K;
    reg CLK;

    wire Q;
    wire Qbar;

    // Instantiate JK flip-flop
    jk_flipflop uut (
        .J(J),
        .K(K),
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
        $dumpfile("jk_flipflop.vcd");
        $dumpvars(0, tb_jk_flipflop);

        $monitor("Time=%0t | CLK=%b J=%b K=%b | Q=%b Qbar=%b",
                 $time, CLK, J, K, Q, Qbar);

        // Initial
        J = 0;
        K = 0;

        #10;

        // SET
        J = 1;
        K = 0;

        #10;

        // HOLD
        J = 0;
        K = 0;

        #10;

        // RESET
        J = 0;
        K = 1;

        #10;

        // SET
        J = 1;
        K = 0;

        #10;

        // TOGGLE
        J = 1;
        K = 1;

        #10;

        // TOGGLE again
        J = 1;
        K = 1;

        #10;

        $finish;

    end

endmodule