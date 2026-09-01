`timescale 1ns / 1ps

module mux_2x1_tb;

    // Inputs (reg) to drive the design under test
    reg i0,i1,s;

    // Outputs (wire) to monitor the design
    wire y;

    // Instantiate the Design Under Test (DUT)
    mux_2x1 dut (
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y)
    );

    // Loop variable for test combinations
    integer i;

    initial begin
        // 1. Icarus Verilog specific waveform dumping commands
        $dumpfile("mux_dump.vcd"); // Creates the VCD file
        $dumpvars(0, mux_2x1_tb);  // Dumps all signals in this module

        // 2. Terminal monitoring setup
        $display("Time\t S \t I1 \t I0 \t Y");
        $display("---------------------------------");
        $monitor("%0dns\t %b \t %b \t %b \t %b", $time, s, i1, i0, y);

        // 3. Test vector generation loop (evaluates all 8 input states)
        for (i = 0; i < 8; i = i + 1) begin
            {s, i1, i0} = i; 
            #10; 
        end

        // End the simulation
        $finish;
    end

endmodule
