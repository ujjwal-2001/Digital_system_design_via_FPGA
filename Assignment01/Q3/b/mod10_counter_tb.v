// Date: 27/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q3 a: Testbench for mod 10 up counter with active low synchronous reset

`include "mod10_counter.v"
`timescale 10ns / 1ns

module mod10_counter_tb();

    reg clk;
    reg reset;
    reg [3:0] in;
    reg load;
    reg [1:0] mode;
    wire [3:0] count;
    wire flag;

    mod10_counter inst(
        .clk(clk),
        .reset(reset),
        .in(in),
        .load(load),
        .mode(mode),
        .count(count)
        );

always #5 clk=~clk;

initial begin

    // monitor all inputs and outputs
    $monitor("T=%d clk=%b, reset=%b, in=%d, load=%b, mode=%b, count=%d, f=%b", $time, clk, reset, in, load, mode, count,flag);

    clk=0;
    reset=1;
    mode=2'b00;
    load=1;
    in=4'd12;

    #10 reset=0;
    #20 reset=1;
    #150 mode=2'b10;
    load=0;
    #180 mode=2'b11;
    #10 load=1;
    #10 load=0;
    #5 mode=2'b10;
    #100 $finish;
end

endmodule  
