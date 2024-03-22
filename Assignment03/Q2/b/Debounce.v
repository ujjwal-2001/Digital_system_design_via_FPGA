module Debounce(
    input wire clk,
    input wire reset,
    input wire in,
    output wire out
    );

    reg [20:0] count_temp;
    reg out_temp;
    reg flag;

    always @ (posedge clk) begin
        if(reset == 0) begin
            count_temp <= 4'd0;
            out_temp <= 1'b0;
            flag <= 1'b0;
        end
        else begin

            if(in == 1'b1) begin
                flag <= 1'b1;
            end

            if(flag == 1) begin
                if(count_temp == 21'd2000000) begin
                    count_temp <= 21'd0;
                    out_temp <= in;
                    flag <= 1'b0;
                end
                else begin
                    count_temp <= count_temp + 1;
                    out_temp <= 1'b0;
                end
            end
            else begin
                count_temp <= 4'd0;
                out_temp <= 1'b0;
            end
        end
    end   

    assign out = out_temp; 

endmodule