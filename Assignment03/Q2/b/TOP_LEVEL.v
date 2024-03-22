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
    wire enable_ext_sync;
    wire enable_ext_stable;

    Sync sync(
        .clk(clk),
        .reset(reset),
        .D(enable_ext),
        .Q(enable_ext_sync)
    );

    Debounce debounce(
        .clk(clk),
        .reset(reset),
        .in(enable_ext_sync),
        .out(enable_ext_stable)
    );

    modN_counter counter( 
        .clk(clk),
        .en_clk(enable_ext_stable),
        .reset(reset),
        .in(in),
        .load(load),
        .mode(mode),
        .count(count)
    );

    thermo_code thermo(
        .clk(clk),
        .counter(count),
        .reset(reset),
        .count(thermo_count)
    );


endmodule