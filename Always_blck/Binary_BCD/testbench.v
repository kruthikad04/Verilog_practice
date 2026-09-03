`timescale 1ns/1ps

module binary_to_bcd_tb;

    reg  [3:0] binary;
    wire [7:0] bcd;

    // Instantiate DUT
    binary_to_bcd uut (
        .binary(binary),
        .bcd(bcd)
    );

    initial begin

        // Create waveform
        $dumpfile("binary_to_bcd.vcd");
        $dumpvars(0, binary_to_bcd_tb);

        $monitor("Time=%0t | Binary=%b (%0d) | BCD=%b",
                 $time, binary, binary, bcd);

        // Test 0
        binary = 4'b0000;
        #10;

        // Test 1
        binary = 4'b0001;
        #10;

        // Test 5
        binary = 4'b0101;
        #10;

        // Test 9
        binary = 4'b1001;
        #10;

        // Test 10
        binary = 4'b1010;
        #10;

        // Test 11
        binary = 4'b1011;
        #10;

        // Test 12
        binary = 4'b1100;
        #10;

        // Test 13
        binary = 4'b1101;
        #10;

        // Test 14
        binary = 4'b1110;
        #10;

        // Test 15
        binary = 4'b1111;
        #10;

        $finish;

    end

endmodule