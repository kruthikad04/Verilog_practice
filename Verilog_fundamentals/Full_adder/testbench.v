// full_adder_tb.v
`timescale 1ns / 1ps

module full_adder_tb;

    // Inputs are declared as registers (reg) to hold state
    reg a;
    reg b;
    reg cin;

    // Outputs are declared as wires to listen to changes from the design
    wire sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Setup Icarus Verilog waveform dumping
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        // Print monitoring labels to the terminal output
        $monitor("Time=%0dns | Inputs: A=%b B=%b Cin=%b | Outputs: Sum=%b Cout=%b", 
                 $time, a, b, cin, sum, cout);

        // Apply all 8 possible binary combinations sequentially
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        // Terminate the simulation cleanly
        $finish;
    end

endmodule
