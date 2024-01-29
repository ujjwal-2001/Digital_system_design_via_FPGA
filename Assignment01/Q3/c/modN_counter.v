// Date: 26/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q3 b: Verilog code for mod 10 counter with following features:-
// 1. Active low synchronous reset
// 2. up-counter
// 3. down-counter
// 4. up-down counter
// 5. load an input value
// 6. hold previous value

module modN_counter(
    input wire clk,
    input wire reset,
    input wire [3:0] in,
    input wire load,
    input wire [1:0] mode,
    input wire [3:0] n,
    output wire [3:0] count,
    output wire f
    );

    reg [3:0] count_temp;
    reg flag;

    assign f = flag;

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

    assign count = count_temp;

endmodule