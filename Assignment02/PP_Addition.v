// addition of PPs

module PP_Addition(
    input wire [8:0]PP0,    
    input wire [8:0]PP1,
    input wire [8:0]PP2,
    input wire [8:0]PP3,
    input wire [3:0] sign,
    output wire [15:0] sum
);

    wire[11:0] row0;
    wire[12:0] row1;
    wire[14:0] row2;
    wire[15:0] row3;

    assign row0 = {~PP0[8] ,PP0[8], PP0[8] , PP0};
    assign row1 = {1'b1, ~PP1[8] ,PP1, 1'b0, sign[0]};
    assign row2 = {1'b1, ~PP2[8] ,PP2, 1'b0, sign[1],2'b00};
    assign row3 = {({~PP3[8] ,PP3} + sign[3]), 1'b0, sign[2], 4'b0000};

    assign sum = row0 + row1 + row2 + row3;

endmodule