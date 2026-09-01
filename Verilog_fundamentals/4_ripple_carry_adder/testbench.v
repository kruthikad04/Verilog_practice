`timescale 1ns / 1ps

module tb_ripple_carry_adder;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    ripple_carry_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("rca_dump.vcd");
        $dumpvars(0, tb_ripple_carry_adder);
        
        // Print output monitoring headers
        $display("Time\t A \t B \tCin \t Sum \tCout");
        $monitor("%0dt\t %b\t %b\t %b \t %b\t %b", $time, A, B, Cin, Sum, Cout);

        // Test Case 1: Simple addition without carry-in or carry-out
        A = 4'b0010; B = 4'b0101; Cin = 1'b0; #10;
        
        // Test Case 2: Addition with a carry-in
        A = 4'b0110; B = 4'b0011; Cin = 1'b1; #10;
        
        // Test Case 3: Generating a final carry-out
        A = 4'b1100; B = 4'b0100; Cin = 1'b0; #10;
        
        // Test Case 4: Maximum boundary scenario (All ones)
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #10;

        $finish;
    end

endmodule
