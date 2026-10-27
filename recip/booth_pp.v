`timescale 1ns / 1ps

module booth_pp (
    input  wire [2:0]  code,
    input  wire [21:0] x1,
    input  wire [21:0] xn1,
    input  wire [21:0] x2,
    input  wire [21:0] xn2,

    output reg  [22:0] pp,
    output reg         neg
);

    always @* begin
        pp  = 23'b0;
        neg = 1'b0;

        case (code)
            // 0
            3'b000: begin
                pp  = {1'b1, 1'b1, 21'b0};
                neg = 1'b0;
            end

            // +x
            3'b001,
            3'b010: begin
                pp  = {
                    1'b1,
                    ~x1[21],
                    x1[20:0]
                };
                neg = 1'b0;
            end

            // +2x
            3'b011: begin
                pp  = {
                    1'b1,
                    ~x2[21],
                    x2[20:0]
                };
                neg = 1'b0;
            end

            // -2x
            3'b100: begin
                pp  = {
                    1'b1,
                    ~xn2[21],
                    xn2[20:0]
                };
                neg = 1'b1;
            end

            // -x
            3'b101,
            3'b110: begin
                pp  = {
                    1'b1,
                    ~xn1[21],
                    xn1[20:0]
                };
                neg = 1'b1;
            end

            // 0
            3'b111: begin
                pp  = {1'b1, 1'b1, 21'b0};
                neg = 1'b0;
            end

            default: begin
                pp  = 23'b0;
                neg = 1'b0;
            end
        endcase
    end

endmodule
