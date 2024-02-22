// Top Module of signed 8-bit Radix-4 Booth Multiplier


module Top (
    input wire [7:0] x,
    input wire [7:0] y,
    output wire [15:0] p
);

    BoothMultiplier BoothMultiplier1 (
        .x(x),
        .y(y),
        .p(p)
    );

endmodule