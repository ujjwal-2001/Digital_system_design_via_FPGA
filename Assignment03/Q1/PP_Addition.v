// addition of PPs

module PP_Addition(
    input wire clk,
    input wire rst,
    input wire [8:0]PP0,    
    input wire [8:0]PP1,
    input wire [8:0]PP2,
    input wire [8:0]PP3,
    input wire [3:0] sign,
    output reg [15:0] sum
);

    wire[11:0] row0;
    wire[12:0] row1;
    wire[14:0] row2;
    wire[15:0] row3;
    reg [15:0] sum0;
    reg [15:0] sum1;

    assign row0 = {~PP0[8] ,PP0[8], PP0[8] , PP0};
    assign row1 = {1'b1, ~PP1[8] ,PP1, 1'b0, sign[0]};
    assign row2 = {1'b1, ~PP2[8] ,PP2, 1'b0, sign[1],2'b00};
    assign row3 = {({~PP3[8] ,PP3} + sign[3]), 1'b0, sign[2], 4'b0000};

    always @(posedge clk)begin
        if(!rst)begin
            sum <= 16'b0;
            sum0 <= 16'b0;
            sum1 <= 16'b0;
        end
        else begin
            sum0 <= row0 + row1;
            sum1 <= row2 + row3;
            sum <= sum1 + sum0;
        end
    end

endmodule