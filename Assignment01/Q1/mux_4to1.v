// Date: 25/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q1 : Verilog code for 4 to 1 mux

module mux_4to1(
    input wire [3:0] in,
    input wire [1:0] sel,
    output wire out
    );

    assign out = in[sel];
    
endmodule