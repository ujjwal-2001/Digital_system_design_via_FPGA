module freq_divider (
  input wire clk,      // Input clock at 100MHz
  output wire clk_out   // Output divided clock at ~1Hz
);

    reg [26:0] count;     // 27-bit counter for a large division factor
    reg clk_out_temp;          // Output clock

    always @(posedge clk) begin
        if (count == 27'd49999999) begin
            count <= 27'd0;
            clk_out_temp <= ~clk_out_temp; // Toggle output on every overflow
        end else begin
            count <= count + 1;
        end
    end

    assign clk_out = clk_out_temp;

endmodule
