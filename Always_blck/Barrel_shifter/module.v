module barrel_shifter (
    input  wire [3:0] data,
    input  wire [1:0] shift,
    input  wire       direction,
    output reg  [3:0] result
);

always @(*) begin

    if (direction == 1'b0)
        // Shift left
        result = data << shift;

    else
        // Shift right
        result = data >> shift;

end

endmodule