// Top Module of signed 8-bit Radix-4 Booth Multiplier


module Top (
    input wire [7:0] x,
    input wire [7:0] y,
    input clock,
    input rst,
    output wire [15:0] p
);

    BoothMultiplier bm(
        .x(x),
        .y(y),
        .clk(clock),
        .rst(rst),
        .p(p)
    );

endmodule