`timescale 1ns/1ps

module bcd_excess3_tb;

    reg  [3:0] bcd;
    wire [3:0] excess3;

    // Instantiate DUT
    bcd_excess3 uut (
        .bcd(bcd),
        .excess3(excess3)
    );

    initial begin

        // Create waveform file
        $dumpfile("bcd_excess3.vcd");
        $dumpvars(0, bcd_excess3_tb);

        $monitor("Time=%0t | BCD=%b | Excess-3=%b",
                 $time, bcd, excess3);

        // Test 0
        bcd = 4'b0000;
        #10;

        // Test 1
        bcd = 4'b0001;
        #10;

        // Test 2
        bcd = 4'b0010;
        #10;

        // Test 3
        bcd = 4'b0011;
        #10;

        // Test 4
        bcd = 4'b0100;
        #10;

        // Test 5
        bcd = 4'b0101;
        #10;

        // Test 6
        bcd = 4'b0110;
        #10;

        // Test 7
        bcd = 4'b0111;
        #10;

        // Test 8
        bcd = 4'b1000;
        #10;

        // Test 9
        bcd = 4'b1001;
        #10;

        // Test invalid BCD
        bcd = 4'b1010;
        #10;

        $finish;

    end

endmodule