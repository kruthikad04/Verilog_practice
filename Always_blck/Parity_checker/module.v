module parity_checker (
    input  wire [3:0] data,
    input  wire       parity,
    output reg        error
);

always @(*) begin

    // XOR of all bits should be 0 for correct even parity
    if (data[3] ^ data[2] ^ data[1] ^ data[0] ^ parity)
        error = 1'b1;
    else
        error = 1'b0;

end

endmodule