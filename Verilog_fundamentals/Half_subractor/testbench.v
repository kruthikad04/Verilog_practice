`timescale 1ns / 1ps

module half_subtractor_tb;

    // Inputs are declared as registers to hold state
    reg a, b;

    // Outputs are declared as wires to capture continuous driven data
    wire diff, borrow;

    // Instantiate the Half Subtractor Unit Under Test (UUT)
    half_subtractor uut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        // Setup file dumping for Icarus Verilog simulation / GTKWave visualization
        $dumpfile("half_subtractor_tb.vcd");
        $dumpvars(0, half_subtractor_tb);

        // Print header monitoring information to the terminal console
        $monitor("Time = %0t ns | Input: a = %b, b = %b | Output: diff = %b, borrow = %b", 
                 $time, a, b, diff, borrow);

        // Apply all 4 possible binary input combinations
        a = 0; b = 0; #10; // Test Case 1: 0 - 0 = 0, Borrow = 0
        a = 0; b = 1; #10; // Test Case 2: 0 - 1 = 1, Borrow = 1
        a = 1; b = 0; #10; // Test Case 3: 1 - 0 = 1, Borrow = 0
        a = 1; b = 1; #10; // Test Case 4: 1 - 1 = 0, Borrow = 0

        // Terminate simulation run cleanly
        $finish;
    end

endmodule
