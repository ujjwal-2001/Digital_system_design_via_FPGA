// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// SR No.: 22577
// Q3

`timescale 1ns / 1ps

module modN_counter_tb();

    reg clk;
    reg reset;
    reg [3:0] in;
    reg load;
    reg [1:0] mode;
    wire [3:0] count;

    top inst(
        .clk(clk),
        .reset(reset),
        .in(in),
        .load(load),
        .mode(mode),
        .count(count)
    );

    always begin
        #5 clk=~clk;
    end

    initial begin

        reset=1'b1;
        clk=1'b0;
        in=4'd11;
        mode=2'b00;

        #10 reset=1'b0;
        #600 reset=1'b1;
        #100 mode=2'b01;
        #100 mode=2'b10;
        #100 mode=2'b11;
        #100 mode=2'b00;
        #100 load=2'b01;
        #100 load=2'b00;
        #100 $finish;

    end

endmodule  
