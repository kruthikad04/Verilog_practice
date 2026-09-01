`timescale 1ns / 1ps

module seven_seg_decoder_tb;

    // Testbench signals
    reg [3:0] tb_hex_val;
    wire [6:0] tb_seg;
    
    // Loop variable
    integer i;

    // Instantiate Unit Under Test (UUT)
    seven_seg_decoder uut (
        .hex_val(tb_hex_val),
        .seg(tb_seg)
    );

    initial begin
        // Setup value change dump (.vcd) files for GTKWave visualization
        $dumpfile("seven_seg_simulation.vcd");
        $dumpvars(0, seven_seg_decoder_tb);
        
        // Print header console display
        $display("Time\tInput(Hex)\tSegments(abcdefg)");
        $monitor("%0d\t%h\t\t%b", $time, tb_hex_val, tb_seg);

        // Iterate through all 16 possible values (0 to 15)
        for (i = 0; i < 16; i = i + 1) begin
            tb_hex_val = i;
            #10; // Wait 10 time units per vector
        end

        // End the simulation execution
        $finish;
    end

endmodule
