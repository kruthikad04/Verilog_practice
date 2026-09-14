module universal_shift_register (
    input  wire       clk,
    input  wire       reset,
    input  wire       s1,
    input  wire       s0,
    input  wire       serial_left,
    input  wire       serial_right,
    input  wire [3:0] parallel_in,
    output reg  [3:0] q
);

always @(posedge clk or posedge reset) begin

    if (reset)
        q <= 4'b0000;

    else begin

        case ({s1, s0})

            2'b00: q <= q;                         // Hold

            2'b01: q <= {serial_right, q[3:1]};   // Shift right

            2'b10: q <= {q[2:0], serial_left};    // Shift left

            2'b11: q <= parallel_in;              // Parallel load

        endcase

    end

end

endmodule