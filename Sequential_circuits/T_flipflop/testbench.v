`timescale 1ns/1ps

module tb_t_flipflop;

    reg T;
    reg CLK;

    wire Q;

    // Instantiate T flip-flop
    t_flipflop uut (
        .T(T),
        .CLK(CLK),
        .Q(Q)
    );

    // Clock generation
    initial begin
        CLK = 0;

        forever #5 CLK = ~CLK;
    end

    // Test inputs
    initial begin

        // GTKWave waveform
        $dumpfile("t_flipflop.vcd");
        $dumpvars(0, tb_t_flipflop);

        $monitor("Time=%0t | CLK=%b T=%b | Q=%b",
                 $time, CLK, T, Q);

        // Initial
        T = 0;

        #10;

        // TOGGLE
        T = 1;

        #20;

        // HOLD
        T = 0;

        #10;

        // TOGGLE
        T = 1;

        #30;

        // HOLD
        T = 0;

        #10;

        $finish;

    end

endmodule