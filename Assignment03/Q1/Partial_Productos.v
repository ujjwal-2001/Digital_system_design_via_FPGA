// Module to generate all partial products

module Partial_Productos(
    input wire [7:0]x,
    input wire [7:0]y,
    output wire [8:0]PP0,    // 8/2 = 4 PP will be generated
    output wire [8:0]PP1,
    output wire [8:0]PP2,
    output wire [8:0]PP3,
    output wire [3:0] sign
);

    wire[8:0] temp_x;

    assign temp_x = {x,1'b0};

    // Generate all partial products
    PP_Generator pp0(
        .x(temp_x[2:0]),
        .y(y),
        .PP(PP0[8:0]),
        .sign_bit(sign[0])
    );

    PP_Generator pp1(
        .x(temp_x[4:2]),
        .y(y),
        .PP(PP1[8:0]),
        .sign_bit(sign[1])
    );

    PP_Generator pp2(
        .x(temp_x[6:4]),
        .y(y),
        .PP(PP2[8:0]),
        .sign_bit(sign[2])
    );

    PP_Generator pp3(
        .x(temp_x[8:6]),
        .y(y),
        .PP(PP3[8:0]),
        .sign_bit(sign[3])
    );

endmodule 