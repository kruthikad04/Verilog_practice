`timescale 1ns / 1ps

module decoder_2to4_tb;

    // Testbench registers (Inputs to the design under test)
    reg tb_en;
    reg [1:0] tb_in;
    
    // Testbench wires (Outputs from the design under test)
    wire [3:0] tb_out;

    // Instantiate the Device Under Test (DUT) using named port connections
    decoder_2to4 dut (
        .en(tb_en),
        .in(tb_in),
        .out(tb_out)
    );

    // Configuration block for Icarus Verilog / GTKWave 
    initial begin
        $dumpfile("decoder_simulation.vcd"); // Creates the waveform file
        $dumpvars(0, decoder_2to4_tb);        // Dumps all signals in this testbench
    end

    // Stimulus block running through all permutations
    initial begin
        // Display Terminal Header formatting 
        $display("Time\t\tEnable\tInput\tOutput");
        $display("--------------------------------------");
        
        // Monitor block auto-prints to console whenever inputs or outputs change
        $monitor("%0dns\t\t%b\t%b\t%b", $time, tb_en, tb_in, tb_out);

        // Case 1: Decoder Disabled (Outputs should remain completely 0000)
        tb_en = 0; tb_in = 2'b00; #10;
        tb_en = 0; tb_in = 2'b01; #10;
        tb_en = 0; tb_in = 2'b10; #10;
        tb_en = 0; tb_in = 2'b11; #10;

        // Case 2: Decoder Enabled (Targeted output bit transitions to active High)
        tb_en = 1; tb_in = 2'b00; #10;
        tb_en = 1; tb_in = 2'b01; #10;
        tb_en = 1; tb_in = 2'b10; #10;
        tb_en = 1; tb_in = 2'b11; #10;

        // Gracefully terminate the simulation runtime
        $finish;
    end

endmodule
