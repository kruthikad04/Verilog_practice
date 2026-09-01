`timescale 1ns / 1ps

module comparator_4bit_tb;

    // Inputs are declared as registers
    reg [3:0] A;
    reg [3:0] B;

    // Outputs are declared as wires
    wire A_gt_B;
    wire A_eq_B;
    wire A_lt_B;

    // Instantiate the Design Under Test (DUT)
    comparator_4bit uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
        // Setup Icarus Verilog waveform dumping
        $dumpfile("comparator_simulation.vcd");
        $dumpvars(0, comparator_4bit_tb);

        // Monitor outputs dynamically in terminal
        $monitor("Time = %0t ns | A = %d, B = %d | Greater = %b, Equal = %b, Less = %b", 
                 $time, A, B, A_gt_B, A_eq_B, A_lt_B);

        // Test Case 1: Equal values
        A = 4'd5;  B = 4'd5;  #10;
        
        // Test Case 2: A greater than B
        A = 4'd12; B = 4'd4;  #10;
        
        // Test Case 3: A less than B
        A = 4'd2;  B = 4'd9;  #10;
        
        // Test Case 4: Boundary condition (Maximum values)
        A = 4'd15; B = 4'd15; #10;
        
        // Test Case 5: Zero boundary condition
        A = 4'd0;  B = 4'd3;  #10;

        // End simulation
        $finish;
    end

endmodule
