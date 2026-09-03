`timescale 1ns/1ps

module gray_to_binary_tb;

    reg  [3:0] gray;
    wire [3:0] binary;

    // Instantiate DUT
    gray_to_binary uut (
        .gray(gray),
        .binary(binary)
    );

    initial begin

        // Create waveform
        $dumpfile("gray_to_binary.vcd");
        $dumpvars(0, gray_to_binary_tb);

        $monitor("Time=%0t | Gray=%b | Binary=%b (%0d)",
                 $time, gray, binary, binary);

        // Test 0000
        gray = 4'b0000;
        #10;

        // Test 0001
        gray = 4'b0001;
        #10;

        // Test 0011
        gray = 4'b0011;
        #10;

        // Test 0010
        gray = 4'b0010;
        #10;

        // Test 0110
        gray = 4'b0110;
        #10;

        // Test 0111
        gray = 4'b0111;
        #10;

        // Test 0101
        gray = 4'b0101;
        #10;

        // Test 0100
        gray = 4'b0100;
        #10;

        // Test 1100
        gray = 4'b1100;
        #10;

        // Test 1101
        gray = 4'b1101;
        #10;

        // Test 1111
        gray = 4'b1111;
        #10;

        // Test 1110
        gray = 4'b1110;
        #10;

        // Test 1010
        gray = 4'b1010;
        #10;

        // Test 1011
        gray = 4'b1011;
        #10;

        // Test 1001
        gray = 4'b1001;
        #10;

        // Test 1000
        gray = 4'b1000;
        #10;

        $finish;

    end

endmodule