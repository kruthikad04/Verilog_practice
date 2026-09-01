// full_adder.v
module full_adder (
    input wire a,    // First input bit
    input wire b,    // Second input bit
    input wire cin,  // Carry-in bit
    output wire sum, // Sum output bit
    output wire cout // Carry-out output bit
);

    // Continuous assignments mapping expressions to output wires
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
