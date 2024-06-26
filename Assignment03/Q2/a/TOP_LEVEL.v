// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// SR No.: 22577

module top(
    input wire clk,
    input wire reset,
    input wire [3:0] in,
    input wire load,
    input wire [1:0] mode,
    input wire enable_ext,
    output wire [14:0] thermo_count
    );

    wire en_clk;
    wire[3:0] count;

    modN_counter inst( 
        .clk(clk),
        .en_clk(enable_ext),
        .reset(reset),
        .in(in),
        .load(load),
        .mode(mode),
        .count(count)
    );

    thermo_code inst2(
        .clk(clk),
        .counter(count),
        .count(thermo_count)
    );


endmodule