// Date: 25/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q1 : Verilog code for 4 to 1 mux testbench
`timescale 1ns / 1ps
`include "mux_4to1.v"
module mux_4to1_tb();

    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    mux_4to1 uut(
        .in(in),
        .sel(sel),
        .out(out)
        );

    initial begin
        in = 4'b0000; sel = 2'b00; 

        for (integer i = 0; i < 16; i = i + 1) begin
            #10 in = in + 1;
                
            for (integer j = 0; j < 4; j = j + 1) begin
                #10 sel = j;
            end
        end
        #10
        $finish;
    end

endmodule