// Booth Encoder Module : Radix-4

module Booth_Encoder (
    input wire [2:0] x,
    output wire [2:0] select
);

    wire single;
    wire double;
    wire negative;

    assign single = x[0]^x[1];
    assign double = (~x[2])&x[1]&x[0] | x[2]&(~x[1])&(~x[0]);
    assign negative = x[2];

    assign select = {single, double, negative };

endmodule