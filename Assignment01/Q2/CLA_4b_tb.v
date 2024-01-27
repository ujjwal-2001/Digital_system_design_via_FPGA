// Date: 25/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q2 : 4-bit Carry Look Ahead Adder testbench

`include "CLA_4b.v"
`timescale 1ns / 1ps


module CLA_4b_tb();

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

    CLA_4b CLA_4b_inst(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
        );

    initial begin

        A = 4'b0000;
        B = 4'b0000;
        Cin = 0;

        for (integer i = 0; i < 16; i = i + 1) begin
            #10 A = A + 1;
            for(integer j = 0; j < 16; j = j + 1) begin
                #10 B = B + 1;
                for(integer k = 0; k < 2; k = k + 1) begin
                    #10 Cin = ~Cin;
                end
            end
        end

    end

endmodule