// Multiplier module

module BoothMultiplier(
    input wire [7:0]x,
    input wire [7:0]y,
    output wire [15:0]p
);

    wire [8:0] PP0, PP1, PP2, PP3;
    wire [3:0] sign;

    Partial_Productos pps(
        .x(x),
        .y(y),
        .PP0(PP0),
        .PP1(PP1),
        .PP2(PP2),
        .PP3(PP3),
        .sign(sign)
    );

    PP_Addition pa(
        .PP0(PP0),
        .PP1(PP1),
        .PP2(PP2),
        .PP3(PP3),
        .sign(sign),
        .sum(p)
    );

endmodule