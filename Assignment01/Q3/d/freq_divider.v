// Name: UJJWAL CHAUDAHRY, M. Tech., ESE [2023 - 2025], IISc Bengaluru
// SR No.: 22577
// Q3

module freq_divider #(parameter div_value=49999999) (
  input wire clk,      // Input clock at 100MHz
  output wire clk_out   // Output divided clock at ~1Hz
);

    integer count=0;     // 27-bit counter for a large division factor
    reg clk_out_temp=0;          // Output clock

    always @(posedge clk) begin
        if (count == div_value) begin
            count <= 0;
            clk_out_temp <= ~clk_out_temp; // Toggle output on every overflow
        end else begin
            count <= count + 1;
        end
    end

    assign clk_out = clk_out_temp;

endmodule
