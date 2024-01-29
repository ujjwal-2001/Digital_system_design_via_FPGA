// Date: 25/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q1 : Verilog code for 4 to 1 mux testbench
`timescale 1ns / 1ps

module mux_4to1_tb();

    reg [3:0] in0;
    reg [3:0] in1;
    reg [3:0] in2;
    reg [3:0] in3;
    reg [1:0] sel;
    wire [3:0] out;

    mux_4to1 uut(
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out(out)
        );

    initial begin
        in0=4'd0;
        in1=4'd1;
        in2=4'd2;
        in3=4'd3;
        sel=2'b00;
        #10 sel=2'b01;
        #10 sel=2'b10;
        #10 sel=2'b11;
        #10 $finish;
    end

endmodule