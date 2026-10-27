`timescale 1ns / 1ps

module booth_pp0 (
    input  wire [1:0]  code,
    input  wire [21:0] x1,
    input  wire [21:0] xn1,
    input  wire [21:0] x2,
    input  wire [21:0] xn2,

    output reg  [23:0] pp,
    output reg         neg
);

    always @* begin
        pp  = 24'b0;
        neg = 1'b0;

        case (code)
            // Booth编码：000，部分积为0
            2'b00: begin
                pp  = {1'b1, 1'b0, 1'b0, 21'b0};
                neg = 1'b0;
            end

            // Booth编码：010，部分积为+x
            2'b01: begin
                pp  = {
                    ~x1[21],
                     x1[21],
                     x1[21],
                     x1[20:0]
                };
                neg = 1'b0;
            end

            // Booth编码：100，部分积为-2x
            2'b10: begin
                pp  = {
                    ~xn2[21],
                     xn2[21],
                     xn2[21],
                     xn2[20:0]
                };
                neg = 1'b1;
            end

            // Booth编码：110，部分积为-x
            2'b11: begin
                pp  = {
                    ~xn1[21],
                     xn1[21],
                     xn1[21],
                     xn1[20:0]
                };
                neg = 1'b1;
            end

            default: begin
                pp  = 24'b0;
                neg = 1'b0;
            end
        endcase
    end

endmodule
