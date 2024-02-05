// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// SR No.: 22577
// Q3

module freq_divider #(parameter div_value=49999999) (
  input wire clk,      // Input clock at 100MHz
  output wire en_clk   // Output enable at ~1Hz
);

    integer count=0;     // 27-bit counter for a large division factor
    reg en_clk_temp = 0;          // Output clock

    always @(posedge clk) begin
        if (count == div_value) begin
            count <= 0;
            en_clk_temp <= 1; 
        end else begin
            count <= count + 1;
            en_clk_temp <= 0;
        end
    end

    assign en_clk = en_clk_temp;

endmodule
