module priority_encoder (
    input  wire [3:0] D,
    output reg  [1:0] Y,
    output reg        valid
);

always @(*) begin

    // Default values
    Y     = 2'b00;
    valid = 1'b1;

    if (D[3] == 1'b1)
        Y = 2'b11;

    else if (D[2] == 1'b1)
        Y = 2'b10;

    else if (D[1] == 1'b1)
        Y = 2'b01;

    else if (D[0] == 1'b1)
        Y = 2'b00;

    else begin
        Y     = 2'b00;
        valid = 1'b0;
    end

end

endmodule