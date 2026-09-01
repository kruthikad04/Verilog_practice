`timescale 1ns / 1ps

module tb_mux4to1;

    // Inputs declared as registers to hold simulated values
    reg [3:0] test_in;
    reg [1:0] test_sel;

    // Outputs declared as wires to capture the driven results
    wire test_out;

    // Instantiate the Unit Under Test (UUT)
    mux4to1_dataflow uut (
        .in(test_in),
        .sel(test_sel),
        .out(test_out)
    );

    initial begin
        // Configure Icarus Verilog waveform dumping
        $dumpfile("mux4to1_sim.vcd"); 
        $dumpvars(0, tb_mux4to1);

        // Monitor signal changes in the terminal environment
        $monitor("Time=%0dns | Inputs: D3-D0 = %b | Select = %b | Output = %b", 
                 $time, test_in, test_sel, test_out);

        // Define a steady static input vector
        test_in = 4'b1010; // D3=1, D2=0, D1=1, D0=0

        // Test Case 1: Select Input 0 (Should output D0 -> 0)
        test_sel = 2'b00; #10;
        
        // Test Case 2: Select Input 1 (Should output D1 -> 1)
        test_sel = 2'b01; #10;
        
        // Test Case 3: Select Input 2 (Should output D2 -> 0)
        test_sel = 2'b10; #10;
        
        // Test Case 4: Select Input 3 (Should output D3 -> 1)
        test_sel = 2'b11; #10;

        // End simulation safely
        $finish;
    end

endmodule
