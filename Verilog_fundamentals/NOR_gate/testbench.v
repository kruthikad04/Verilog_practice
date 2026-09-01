`timescale 1ns / 1ps

module tb_nor_gate;

    // Inputs are declared as registers (reg) to hold values
    reg a, b;
    // Outputs are declared as wires to capture the driven values
    wire out;

    // Instantiate the Device Under Test (DUT)
    nor_gate uut (
        .a(a),
        .b(b),
        .out(out)
    );

    // Monitor changes automatically in the terminal
    initial begin
        $monitor("Time = %0t ns | Input A = %b | Input B = %b | Output OUT = %b", $time, a, b, out);
    end

    // Stimulus block to sweep through all truth table entries
    initial begin
        // Optional: Dump waveforms for viewing in GTKWave
        $dumpfile("nor_waveform.vcd");
        $dumpvars(0, tb_nor_gate);

        // Case 1: Both 0
        a = 0; b = 0;
        #10; // Wait 10 time units

        // Case 2: 0 and 1
        a = 0; b = 1;
        #10;

        // Case 3: 1 and 0
        a = 1; b = 0;
        #10;

        // Case 4: Both 1
        a = 1; b = 1;
        #10;

        // End the simulation
        $finish;
    end

endmodule
