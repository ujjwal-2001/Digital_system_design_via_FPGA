// Booth Selector Module Radix-4

module Booth_Selector (
    input wire [2:0] select,
    input wire [7:0] y,
    output wire [8:0] PP
);

    reg[8:0] pp_temp;

    always@(*)begin
        case(select)        // select[2] = single, select[1] = double, select[0] = negative 
            3'b000: pp_temp = 9'b0_0000_0000;   // 0
            3'b100: pp_temp = {y[7], y};     // y
            3'b010: pp_temp = {y, 1'b0};     // 2y
            3'b011: pp_temp = {~y, 1'b1};    // -2y
            3'b101: pp_temp = {~y[7], ~y};   // -y
            3'b001: pp_temp = 9'b1_1111_1111;   // -0
            default: pp_temp = 9'b0_0000_0000;   // 0
        endcase
    end

    assign PP = pp_temp;

endmodule