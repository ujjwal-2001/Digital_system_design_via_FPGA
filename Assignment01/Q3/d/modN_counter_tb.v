// Date: 27/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q3 a: Testbench for mod N up counter with active low synchronous reset

`include "modN_counter.v"
`include "freq_divider.v"
`timescale 10ns / 1ns

module modN_counter_tb();

    reg clk;
    reg reset;
    reg [3:0] in;
    reg load;
    reg [1:0] mode;
    reg [3:0] n;
    wire [3:0] count;
    wire clk_div;

    freq_divider inst1(
        .clk(clk),
        .clk_out(clk_div)
        );

    modN_counter inst(
        .clk(clk_div),
        .reset(reset),
        .in(in),
        .load(load),
        .mode(mode),
        .count(count),
        .n(n)
        );

always #5 clk=~clk;

initial begin

    // monitor all inputs and outputs
    $monitor("time=%d clk=%b, n=%d, reset=%b, in=%d, load=%b, mode=%b, count=%d", $time, clk, n, reset, in, load, mode, count);
    clk=0;
    reset=1;
    mode=2'b00;
    load=0;
    in=4'd12;
    n=4'd15;

    #10 reset=0;
    #20 reset=1;
    #250 mode=2'b01;
    #250 mode=2'b10;
    #250 mode=2'b11;
    #50 load=1;
    #20 $finish;
end

endmodule  
