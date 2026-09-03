`timescale 1ns/1ps

module barrel_shifter_tb;

    reg  [3:0] data;
    reg  [1:0] shift;
    reg        direction;

    wire [3:0] result;

    // Instantiate the barrel shifter
    barrel_shifter uut (
        .data(data),
        .shift(shift),
        .direction(direction),
        .result(result)
    );

    initial begin

        // Create waveform
        $dumpfile("barrel_shifter.vcd");
        $dumpvars(0, barrel_shifter_tb);

        $monitor("Time=%0t | Data=%b | Shift=%b | Direction=%b | Result=%b",
                 $time, data, shift, direction, result);

        // --------------------------------
        // LEFT SHIFT TESTS
        // --------------------------------

        data = 4'b1011;
        shift = 2'b00;
        direction = 1'b0;
        #10;

        data = 4'b1011;
        shift = 2'b01;
        direction = 1'b0;
        #10;

        data = 4'b1011;
        shift = 2'b10;
        direction = 1'b0;
        #10;

        data = 4'b1011;
        shift = 2'b11;
        direction = 1'b0;
        #10;


        // --------------------------------
        // RIGHT SHIFT TESTS
        // --------------------------------

        data = 4'b1011;
        shift = 2'b00;
        direction = 1'b1;
        #10;

        data = 4'b1011;
        shift = 2'b01;
        direction = 1'b1;
        #10;

        data = 4'b1011;
        shift = 2'b10;
        direction = 1'b1;
        #10;

        data = 4'b1011;
        shift = 2'b11;
        direction = 1'b1;
        #10;

        $finish;

    end

endmodule