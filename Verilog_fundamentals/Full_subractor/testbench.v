// full_subtractor_tb.v
`timescale 1ns / 1ps

module full_subtractor_tb;

    // Inputs are declared as registers (reg) to hold values
    reg a;
    reg b;
    reg bin;

    // Outputs are declared as wires
    wire diff;
    wire bout;

    // Instantiate the Unit Under Test (UUT)
    full_subtractor uut (
        .a(a),.b(b),.bin(bin),.diff(diff),.bout(bout));

    initial begin
        // Setup dumpfiles for Icarus Verilog simulation viewing
        $dumpfile("full_subtractor_wave.vcd");
        $dumpvars(0, full_subtractor_tb);

        // Display headers in the console output
        $display("Time\t A \t B \t Bin \t Diff \t Bout");
        $display("---------------------------------------------");
        
        // Monitor outputs automatically on any signal change
        $monitor("%4pt\t %b \t %b \t  %b  \t  %b   \t  %b", $time, a, b, bin, diff, bout);

        // Test all 8 combinations sequentially with 10ns intervals
        a = 0; b = 0; bin = 0; #10;
        a = 0; b = 0; bin = 1; #10;
        a = 0; b = 1; bin = 0; #10;
        a = 0; b = 1; bin = 1; #10;
        a = 1; b = 0; bin = 0; #10;
        a = 1; b = 0; bin = 1; #10;
        a = 1; b = 1; bin = 0; #10;
        a = 1; b = 1; bin = 1; #10;

        // End the simulation
        $finish;
    end

endmodule
