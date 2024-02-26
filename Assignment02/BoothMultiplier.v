// Multiplier module

module BoothMultiplier(
    input wire [7:0]x,
    input wire [7:0]y,
    input wire clk,
    input wire rst,
    output wire [15:0]p
);

    wire [8:0] PP0, PP1, PP2, PP3;
    wire [3:0] sign;
    wire [7:0] x1, y1;
    wire [15:0] p1;

    DFF dff(
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y),
        .p1(p1),
        .x1(x1),
        .y1(y1),
        .p(p)
    );

    Partial_Productos pps(
        .x(x1),
        .y(y1),
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
        .sum(p1)
    );

endmodule