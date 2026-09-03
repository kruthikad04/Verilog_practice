`timescale 1ns/1ps

module parity_checker_tb;

    reg  [3:0] data;
    reg        parity;

    wire       error;

    // Instantiate DUT
    parity_checker uut (
        .data(data),
        .parity(parity),
        .error(error)
    );

    initial begin

        // Create waveform
        $dumpfile("parity_checker.vcd");
        $dumpvars(0, parity_checker_tb);

        $monitor("Time=%0t | Data=%b | Parity=%b | Error=%b",
                 $time, data, parity, error);

        // -------------------------
        // Test 1
        // Data = 0000
        // Number of 1s = 0 (even)
        // Correct parity = 0
        // -------------------------
        data = 4'b0000;
        parity = 1'b0;
        #10;

        // -------------------------
        // Test 2
        // Data = 0001
        // Number of 1s = 1 (odd)
        // Correct parity = 1
        // -------------------------
        data = 4'b0001;
        parity = 1'b1;
        #10;

        // -------------------------
        // Test 3
        // Data = 0011
        // Number of 1s = 2 (even)
        // Correct parity = 0
        // -------------------------
        data = 4'b0011;
        parity = 1'b0;
        #10;

        // -------------------------
        // Test 4
        // Data = 1011
        // Number of 1s = 3 (odd)
        // Correct parity = 1
        // -------------------------
        data = 4'b1011;
        parity = 1'b1;
        #10;

        // -------------------------
        // Test 5
        // Incorrect parity
        // Data = 1011
        // Parity = 0
        // Total 1s = 3 (odd)
        // -------------------------
        data = 4'b1011;
        parity = 1'b0;
        #10;

        // -------------------------
        // Test 6
        // Data = 1111
        // Number of 1s = 4 (even)
        // Correct parity = 0
        // -------------------------
        data = 4'b1111;
        parity = 1'b0;
        #10;

        // -------------------------
        // Test 7
        // Incorrect parity
        // Data = 1111
        // Parity = 1
        // Total 1s = 5 (odd)
        // -------------------------
        data = 4'b1111;
        parity = 1'b1;
        #10;

        $finish;

    end

endmodule