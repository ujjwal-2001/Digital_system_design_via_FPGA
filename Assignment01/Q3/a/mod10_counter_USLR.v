// Date: 25/01/2023
// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// Q3 a: Verilog code for mod 10 up counter with active low synchronous reset

module mod10_counter_USLR(
    input wire clk,
    input wire reset,
    output wire [3:0] count
    );

    reg [3:0] count_temp;

    always @(posedge clk) begin
        if(!reset || count_temp == 4'b1001)
            count_temp <= 4'b0;
        else
            count_temp <= count_temp + 1;
    end

    assign count = count_temp; 

endmodule