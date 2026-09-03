`timescale 1ns/1ps

module priority_encoder_tb;

    reg  [3:0] D;

    wire [1:0] Y;
    wire       valid;

    // Instantiate DUT
    priority_encoder uut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    initial begin

        // Create waveform
        $dumpfile("priority_encoder.vcd");
        $dumpvars(0, priority_encoder_tb);

        $monitor("Time=%0t | D=%b | Y=%b | Valid=%b",
                 $time, D, Y, valid);

        // -------------------------
        // Test 1: Only D0 = 1
        // -------------------------
        D = 4'b0001;
        #10;

        // -------------------------
        // Test 2: Only D1 = 1
        // -------------------------
        D = 4'b0010;
        #10;

        // -------------------------
        // Test 3: Only D2 = 1
        // -------------------------
        D = 4'b0100;
        #10;

        // -------------------------
        // Test 4: Only D3 = 1
        // -------------------------
        D = 4'b1000;
        #10;

        // -------------------------
        // Test 5: D2 and D1 are 1
        // D2 has higher priority
        // -------------------------
        D = 4'b0110;
        #10;

        // -------------------------
        // Test 6: D3 and D1 are 1
        // D3 has higher priority
        // -------------------------
        D = 4'b1010;
        #10;

        // -------------------------
        // Test 7: All inputs are 1
        // D3 has highest priority
        // -------------------------
        D = 4'b1111;
        #10;

        // -------------------------
        // Test 8: No input
        // -------------------------
        D = 4'b0000;
        #10;

        $finish;

    end

endmodule