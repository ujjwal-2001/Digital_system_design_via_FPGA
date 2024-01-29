// Date: 25/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q1 : Verilog code for 4 to 1 mux

module mux_4to1(
    input wire [3:0] in0,
    input wire [3:0] in1,
    input wire [3:0] in2,
    input wire [3:0] in3,
    input wire [1:0] sel,
    output wire [3:0]out
    );

    reg [3:0] out_temp;

    assign out = out_temp;

    always @(*) begin
        case(sel)
            2'b00: out_temp = in0;
            2'b01: out_temp = in1;
            2'b10: out_temp = in2;
            2'b11: out_temp = in3;
            default: out_temp = 4'bxxxx;
        endcase
    end
    
endmodule