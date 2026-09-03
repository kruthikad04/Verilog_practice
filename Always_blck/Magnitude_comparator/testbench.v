`timescale 1ns/1ps

module magnitude_comparator_tb;

    reg  [3:0] A;
    reg  [3:0] B;

    wire A_greater;
    wire A_equal;
    wire A_less;

    // Instantiate DUT
    magnitude_comparator uut (
        .A(A),
        .B(B),
        .A_greater(A_greater),
        .A_equal(A_equal),
        .A_less(A_less)
    );

    initial begin

        // Create waveform
        $dumpfile("magnitude_comparator.vcd");
        $dumpvars(0, magnitude_comparator_tb);

        $monitor("Time=%0t | A=%b (%0d) | B=%b (%0d) | A>B=%b | A=B=%b | A<B=%b",
                 $time, A, A, B, B,
                 A_greater, A_equal, A_less);

        // -------------------------
        // Test 1: A > B
        // -------------------------
        A = 4'b1010;   // 10
        B = 4'b0110;   // 6
        #10;

        // -------------------------
        // Test 2: A < B
        // -------------------------
        A = 4'b0011;   // 3
        B = 4'b1001;   // 9
        #10;

        // -------------------------
        // Test 3: A = B
        // -------------------------
        A = 4'b0111;   // 7
        B = 4'b0111;   // 7
        #10;

        // -------------------------
        // Test 4: A > B
        // -------------------------
        A = 4'b1111;   // 15
        B = 4'b0000;   // 0
        #10;

        // -------------------------
        // Test 5: A < B
        // -------------------------
        A = 4'b0001;   // 1
        B = 4'b1110;   // 14
        #10;

        // -------------------------
        // Test 6: A = B
        // -------------------------
        A = 4'b1010;   // 10
        B = 4'b1010;   // 10
        #10;

        $finish;

    end

endmodule