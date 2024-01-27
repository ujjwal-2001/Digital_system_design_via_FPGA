// Date: 26/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru


module modN_counter(
    input wire clk,
    input wire reset,
    input wire [3:0] in,
    input wire load,
    input wire [1:0] mode,
    input wire [3:0] n,
    output wire [3:0] count
    );

    reg [3:0] count_temp;
    reg flag;

    always @ (posedge clk) begin
        if (reset == 0) begin
            count_temp <= 4'd0;
            flag <= 1'b0;
        end
        else if(load) begin
            count_temp <= in;
        end
        else begin
            case(mode)
                2'b00: count_temp <= (count_temp == n)? 4'd0 : count_temp + 1; // up-counter
                2'b01: count_temp <= (count_temp == 4'b0)? n - 1 :count_temp - 1; // down-counter
                2'b10: begin // up-down counter
                    if(!flag)begin
                        count_temp <= (count_temp == 4'd9)? n - 1 : count_temp + 1;
                    end
                    else begin
                        count_temp <= (count_temp == 4'b0)? 4'd1 :count_temp - 1;
                    end
                end
                2'b11: count_temp <= count_temp; // hold previous value
                default: count_temp <= 4'd0;
            endcase
        end
    end

    always @ (posedge clk) begin
        if(mode == 2'b10) begin
            if(count_temp == 4'd9) begin
                flag <= 1'b1;
            end
            else if(count_temp == 4'd0) begin
                flag <= 1'b0;
            end else begin
                flag <= flag;
            end
        end
    end

    assign count = count_temp;

endmodule