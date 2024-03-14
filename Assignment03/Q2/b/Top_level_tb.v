// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// SR No.: 22577

`timescale 1ns / 1ps

dmodule top_level_tb();

    reg clk;
    reg reset;
    reg [3:0] in;
    reg load;
    reg [1:0] mode;
    reg enable_ext;
    wire [14:0] thermo_count;

    top inst(
        .clk(clk),
        .reset(reset),
        .in(in),
        .load(load),
        .mode(mode),
        .thermo_count(thermo_count)
    );

    always begin
        #5 clk=~clk;
    end

    initial begin

        reset=1'b0;
        clk=1'b0;
        in=4'd11;
        load=0;
        mode=2'b00;
        enable_ext=1;

        #30 reset=1'b1;
        #500 mode=2'b01;
        #500 mode=2'b10;
        #500 mode=2'b11;
        #500 mode=2'b00;
        #500 load=2'b01;
        #500 load=2'b00;
    end

endmodule  
