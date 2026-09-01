`timescale 1ns / 1ps

module tb_demux_1_4;

    // Inputs to the UUT (Unit Under Test)
    reg din;
    reg [1:0] sel;

    // Outputs from the UUT
    wire y0,y1,y2,y3;

    // Instantiate the Unit Under Test
    demux_1_4_dataflow uut (.din(din),.sel(sel),.y0(y0),.y1(y1),.y2(y2),.y3(y3));

    initial begin
        // Setup Icarus Verilog waveform dumping
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_demux_1_4);

        // Monitor outputs in the terminal
        $monitor("Time=%0dt | din=%b sel=%b | y3 y2 y1 y0 = %b %b %b %b", 
                 $time, din, sel, y3, y2, y1, y0);

        // Test Sequence
        din = 1;  // Keep input high to easily trace routing

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        din = 0;  // Switch input to low
        sel = 2'b01; #10;
        sel = 2'b11; #10;

        $finish;  // Terminate simulation
    end

endmodule
