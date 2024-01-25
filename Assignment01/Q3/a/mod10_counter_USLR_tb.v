// Date: 18/09/2020
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q3 a: Testbench for mod 10 up counter with active low synchronous reset

`include "mod10_counter_USLR.v"
`timescale 10ns / 1ns

module mod10_counter_USLR_tb();

    reg clk;
    reg reset;
    wire [3:0] count;

    mod10_counter_USLR mod10_counter_USLR_inst(
        .clk(clk),
        .reset(reset),
        .count(count)
        );    

always #5 clk=~clk;

initial begin

    $monitor("time=%d\tclk=%b\trst=%b\tcount=%d\t",$time,clk,reset,count);

    clk=0;
    reset=1;

    #10 reset=0;
    #20 reset=1;
    #150 $finish;
end

endmodule  
