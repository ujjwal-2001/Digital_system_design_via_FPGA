// Date: 18/09/2020
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q1 : Verilog code for 4 to 1 mux

module 4to1_mux(
    input wire [3:0] in;
    input wire [1:0] sel;
    output wire out;
    );

    assign out = in[sel];


endmodule