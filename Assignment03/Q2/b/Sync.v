module Sync(
    input wire clk,
    input wire reset,
    input wire D,
    output wire Q
    );

    reg Q_temp1,Q_temp2;

    always@(posedge clk) begin
        if(~reset) begin
            Q_temp1 <= 1'b0;
            Q_temp2 <= 1'b0;
        end else begin
            Q_temp1 <= D;
            Q_temp2 <= Q_temp1;
        end
    end

    assign Q = Q_temp2;

endmodule