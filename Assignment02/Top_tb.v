// Test bench for the top level module

`timescale 1ns / 1ps

module top_tb();

    reg [7:0] x;
    reg [7:0] y;
    wire [15:0] p;
    reg clock;
    reg rst;

    Top inst(
        .x(x),
        .y(y),
        .p(p),
        .clock(clock),
        .rst(rst)
    );

    always begin
        #5 clock = ~clock;
    end

    initial begin

        x=8'b00000000;
        y=8'b00000001;
        rst=0;
        clock=0;
        #10 rst=1;
        #10 x=8'b00000001;
        #10 y=8'b00000010;
        #10 x=8'b00000011;
        #10 y=8'b00000100;
        #10 x=8'b00000101;
        #10 y=8'b00000110;
        #10 x=8'b00000111;

        #10 x=8'b11111111;
        #10 y=8'b00000010;
        #10 x=8'b11111110;
        #10 y=8'b00000100;
        #10 x=8'b11111011;
        #10 y=8'b00000110;
        #10 x=8'b11111001;

        
        #10 x=8'b00000001;
        #10 y=8'b11111110;
        #10 x=8'b00000011;
        #10 y=8'b11111100;
        #10 x=8'b00000101;
        #10 y=8'b11111010;
        #10 x=8'b00000111;

        #10 x=8'b10000001;
        #10 y=8'b10000010;
        #10 x=8'b10000011;
        #10 y=8'b10000100;
        #10 x=8'b10000101;
        #10 y=8'b10000110;
        #10 x=8'b10000111;


    end

endmodule