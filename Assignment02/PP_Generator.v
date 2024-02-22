// Parial Product generation module


module PP_Generator(
    input wire [2:0]x,
    input wire [7:0]y,
    output wire [8:0]PP,
    output wire sign_bit
);

    wire [2:0] select;

    Booth_Encoder be(
        .x(x),
        .select(select)
    );

    assign sign_bit = select[0];

    Booth_Selector bs(
        .select(select),
        .y(y),
        .PP(PP)
    );

endmodule
