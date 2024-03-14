// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// SR No.: 22577

module modN_counter #(parameter n=10) (
    input wire clk,
    input wire en_clk,
    input wire reset,
    input wire [3:0] in,
    input wire load,
    input wire enable_ext,
    input wire [1:0] mode,
    output wire [3:0] count
    );

    reg [3:0] count_temp;
    reg flag;

    always @ (posedge clk) begin
        if(en_clk || enable_ext)begin
            if (reset == 0) begin
                count_temp <= 4'd0;
                flag <= 1'b0;
            end
            else if(load) begin
                count_temp <= in;
            end
            else begin
                case(mode)
                    2'b00: begin
                        count_temp <= (count_temp >= n-1)? 4'd0 : count_temp + 1; // up-counter
                        flag <= 1'b0;
                    end
                    2'b01: begin
                        count_temp <= (count_temp == 4'b0 || count_temp > n-1)? n - 1 :count_temp - 1; // down-counter
                        flag <= 1'b0;
                    end
                    2'b10: begin // up-down counter
                        if(!flag)begin
                            count_temp <= ((count_temp == n-1)? n-2 : (count_temp > n)? 4'd0 : count_temp + 1);
                            if(count_temp == n-1)begin
                                flag <= 1'b1;
                            end else begin
                                flag <= flag;
                            end
                        end
                        else begin
                            count_temp <= (count_temp == 4'b0)? 4'd1 :count_temp - 1;
                            if(count_temp == 4'd0)begin
                                flag <= 1'b0;
                            end else begin
                                flag <= flag;
                            end
                        end
                    end
                    2'b11: begin
                        count_temp <= count_temp; // hold previous value
                        flag <= 1'b0;
                    end
                    default: count_temp <= 4'd0;
                endcase
            end
        end
        else begin
            count_temp <= count_temp;
            flag <= flag;
        end
    end

    assign count = count_temp;

endmodule