`timescale 1ns / 1ps

module tb_xnor_gate;

    // Inputs are declared as registers (reg) to hold values
    reg a,b;

    // Outputs are declared as wires to capture the driven values
    wire out;

    // Instantiate the Device Under Test (DUT)
    xnor_gate uut (
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
        $dumpfile("xnor_waveform.vcd");
        $dumpvars(0, tb_xnor_gate);

        // Case 1: Inputs match (0, 0) -> Expect 1
        a = 0; b = 0;
        #10;

        // Case 2: Inputs differ (0, 1) -> Expect 0
        a = 0; b = 1;
        #10;

        // Case 3: Inputs differ (1, 0) -> Expect 0
        a = 1; b = 0;
        #10;

        // Case 4: Inputs match (1, 1) -> Expect 1
        a = 1; b = 1;
        #10;

        // End the simulation
        $finish;
    end

endmodule
