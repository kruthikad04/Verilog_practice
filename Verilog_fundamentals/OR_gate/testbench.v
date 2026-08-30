`timescale 1ns / 1ps

module tb_or_gate;

    // Testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate the Unit Under Test (UUT)
    or_gate_dataflow uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Waveform and Simulation Control
    initial begin
        // 1. Create the waveform database file for GTKWave
        $dumpfile("or_wave.vcd");
        $dumpvars(0, tb_or_gate);

        // 2. Print output values to terminal window
        $monitor("Time=%0td | Inputs: a=%b, b=%b | Output: y=%b", $time, a, b, y);
        
        // 3. Truth Table Simulation (4 States)
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        // 4. Terminate simulation
        $finish;
    end

endmodule
