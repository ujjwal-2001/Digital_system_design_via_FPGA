// D flip flop with synchronous reset

module DFF (
    input wire clk, 
    input wire rst, 
    input wire [7:0] x, 
    input wire [7:0] y, 
    input wire [15:0] p1, 
    output reg [7:0] x1,
    output reg [7:0] y1,
    output reg [15:0] p
    );

    always@(posedge clk)begin
        if(!rst)begin
            p<=16'b0;
            x1<=8'b0;
            y1<=8'b0;
        end
        else begin
            p<=p1;
            x1<=x;
            y1<=y;
        end
    end

endmodule