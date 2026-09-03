`timescale 1ns / 1ps

module tb_mux2to1;
    reg  in0;
    reg  in1;
    reg  sel;
    wire out;

    integer errors = 0;

    // Instantiate the Unit Under Test (UUT)
    mux2to1 uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    // Task to apply inputs and check expected output
    task check_output(input exp_val);
        #5; // Wait for combinational propagation
        if (out !== exp_val) begin
            $display("[FAIL] Time=%0t | sel=%b in0=%b in1=%b | Expected out=%b, Got=%b", 
                     $time, sel, in0, in1, exp_val, out);
            errors = errors + 1;
        end else begin
            $display("[PASS] Time=%0t | sel=%b in0=%b in1=%b | out=%b", 
                     $time, sel, in0, in1, out);
        end
        #5;
    endtask

    initial begin
        // Setup waveform dumping for GTKWave
        $dumpfile("mux2to1_waves.vcd");
        $dumpvars(0, tb_mux2to1);

        // Apply all 8 combinations of {sel, in1, in0}
        sel = 0; in0 = 0; in1 = 0; check_output(0);
        sel = 0; in0 = 1; in1 = 0; check_output(1);
        sel = 0; in0 = 0; in1 = 1; check_output(0);
        sel = 0; in0 = 1; in1 = 1; check_output(1);

        sel = 1; in0 = 0; in1 = 0; check_output(0);
        sel = 1; in0 = 1; in1 = 0; check_output(0);
        sel = 1; in0 = 0; in1 = 1; check_output(1);
        sel = 1; in0 = 1; in1 = 1; check_output(1);

        // Summary report
        if (errors == 0)
            $display("\n=== ALL TESTS PASSED ===");
        else
            $display("\n=== TEST FAILED with %0d error(s) ===", errors);

        $finish;
    end
endmodule