`timescale 1ns / 1ps

module booth_one (
    input  [14:0]  k,      // signed, k[14] is sign bit
    input  [19:0]  x,      // unsigned
    output reg [184:0] pd,
    output reg [7:0]   neg
);

    wire [21:0] x_1;
    wire [21:0] x_n1;
    wire [21:0] x_2;
    wire [21:0] x_n2;

    assign x_1  = {2'b0, x};        // +x
    assign x_n1 = ~x_1;             // ~x
    assign x_2  = {1'b0, x, 1'b0};  // +2x
    assign x_n2 = ~x_2;             // ~2x

    function [23:0] booth_pp0;
        input [1:0]  code;
        input [21:0] x1;
        input [21:0] xn1;
        input [21:0] x2;
        input [21:0] xn2;
        begin
            case (code)
                2'b00: booth_pp0 = {1'b1, 1'b0, 1'b0, 21'b0};
                2'b01: booth_pp0 = {~x1[21],  x1[21],  x1[21],  x1[20:0]};
                2'b10: booth_pp0 = {~xn2[21], xn2[21], xn2[21], xn2[20:0]};
                2'b11: booth_pp0 = {~xn1[21], xn1[21], xn1[21], xn1[20:0]};
                default: booth_pp0 = 24'b0;
            endcase
        end
    endfunction

    function [22:0] booth_pp;
        input [2:0]  code;
        input [21:0] x1;
        input [21:0] xn1;
        input [21:0] x2;
        input [21:0] xn2;
        begin
            case (code)
                3'b000: booth_pp = {1'b1, 1'b1, 21'b0};
                3'b001: booth_pp = {1'b1, ~x1[21],  x1[20:0]};
                3'b010: booth_pp = {1'b1, ~x1[21],  x1[20:0]};
                3'b011: booth_pp = {1'b1, ~x2[21],  x2[20:0]};
                3'b100: booth_pp = {1'b1, ~xn2[21], xn2[20:0]};
                3'b101: booth_pp = {1'b1, ~xn1[21], xn1[20:0]};
                3'b110: booth_pp = {1'b1, ~xn1[21], xn1[20:0]};
                3'b111: booth_pp = {1'b1, 1'b1, 21'b0};
                default: booth_pp = 23'b0;
            endcase
        end
    endfunction

    function booth_neg0;
        input [1:0] code;
        begin
            case (code)
                2'b10: booth_neg0 = 1'b1;
                2'b11: booth_neg0 = 1'b1;
                default: booth_neg0 = 1'b0;
            endcase
        end
    endfunction

    function booth_neg;
        input [2:0] code;
        begin
            case (code)
                3'b100: booth_neg = 1'b1;
                3'b101: booth_neg = 1'b1;
                3'b110: booth_neg = 1'b1;
                default: booth_neg = 1'b0;
            endcase
        end
    endfunction

    always @* begin
        pd[23:0]    = booth_pp0(k[1:0], x_1, x_n1, x_2, x_n2);
        neg[0]      = booth_neg0(k[1:0]);

        pd[46:24]   = booth_pp(k[3:1], x_1, x_n1, x_2, x_n2);
        neg[1]      = booth_neg(k[3:1]);

        pd[69:47]   = booth_pp(k[5:3], x_1, x_n1, x_2, x_n2);
        neg[2]      = booth_neg(k[5:3]);

        pd[92:70]   = booth_pp(k[7:5], x_1, x_n1, x_2, x_n2);
        neg[3]      = booth_neg(k[7:5]);

        pd[115:93]  = booth_pp(k[9:7], x_1, x_n1, x_2, x_n2);
        neg[4]      = booth_neg(k[9:7]);

        pd[138:116] = booth_pp(k[11:9], x_1, x_n1, x_2, x_n2);
        neg[5]      = booth_neg(k[11:9]);

        pd[161:139] = booth_pp(k[13:11], x_1, x_n1, x_2, x_n2);
        neg[6]      = booth_neg(k[13:11]);

        // 关键：15-bit signed k 的最高 Booth 组需要符号扩展
        pd[184:162] = booth_pp({k[14], k[14], k[13]}, x_1, x_n1, x_2, x_n2);
        neg[7]      = booth_neg({k[14], k[14], k[13]});
    end
    
    
    
    
    

endmodule
