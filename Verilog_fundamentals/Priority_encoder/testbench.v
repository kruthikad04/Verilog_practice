`timescale 1ns / 1ps

module tb_priority_encoder_df;

    // Inputs are declared as registers to hold vectors
    reg [3:0] in;

    // Outputs are declared as wires to capture dataflow driven values
    wire [1:0] out;
    wire idle;

    // Loop variable declared as integer for test stimulation
    integer i;

    // Instantiate the Device Under Test (DUT)
    priority_encoder_df uut (
        .in(in),
        .out(out),
        .idle(idle)
    );

    // Monitor changes automatically in the terminal
    initial begin
        $monitor("Time = %0t ns | Input [3:0] = %b | Output [1:0] = %b | Idle = %b", $time, in, out, idle);
    end

    // Stimulus block running a complete exhaustive test
    initial begin
        // Dump waveforms for viewing in GTKWave
        $dumpfile("priority_df_waveform.vcd");
        $dumpvars(0, tb_priority_encoder_df);

        // Loop from 0 up to 15 (all 16 input conditions)
        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #10; // Wait 10 time units between changes
        end

        // End the simulation
        $finish;
    end

endmodule