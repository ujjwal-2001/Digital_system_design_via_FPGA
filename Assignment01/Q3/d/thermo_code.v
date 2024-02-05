module thermo_code(
    input wire [3:0] counter,
    output wire [14:0] count
    );

    reg [14:0] count_temp = 15'b0;

    always@(*) begin
        case(counter)
             4'd0: count_temp = 15'b000_0000_0000_0000;
             4'd1: count_temp = 15'b000_0000_0000_0001;
             4'd2: count_temp = 15'b000_0000_0000_0011;
             4'd3: count_temp = 15'b000_0000_0000_0111;
             4'd4: count_temp = 15'b000_0000_0000_1111;
             4'd5: count_temp = 15'b000_0000_0001_1111;
             4'd6: count_temp = 15'b000_0000_0011_1111;
             4'd7: count_temp = 15'b000_0000_0111_1111;
             4'd8: count_temp = 15'b000_0000_1111_1111;
             4'd9: count_temp = 15'b000_0001_1111_1111;
             4'd10: count_temp = 15'b000_0011_1111_1111;
             4'd11: count_temp = 15'b000_0111_1111_1111;
             4'd12: count_temp = 15'b000_1111_1111_1111;
             4'd13: count_temp = 15'b001_1111_1111_1111;
             4'd14: count_temp = 15'b011_1111_1111_1111;
             4'd15: count_temp = 15'b111_1111_1111_1111;
            default: count_temp = 15'b000_0000_0000_0000;
        endcase
    end

    assign count = count_temp;

endmodule
