`timescale 1ns / 1ps

module booth_one (
    input      [14:0]  k,
    input      [19:0]  x,
    output reg [184:0] pd,
    output reg [7:0]   neg
);

    wire [21:0] x1;
    wire [21:0] xn1;
    wire [21:0] x2;
    wire [21:0] xn2;

    assign x1  = {2'b0, x};         // +x
    assign xn1 = ~x1;               // ~x
    assign x2  = {1'b0, x, 1'b0};   // +2x
    assign xn2 = ~x2;               // ~2x

    always @*
    begin

        // 第0组：k[1:0]
        case (k[1:0])
            2'b00:
            begin
                pd[23:0] <= {1'b1, 1'b0, 1'b0, 21'b0};
                neg[0]   <= 1'b0;
            end

            2'b01:
            begin
                pd[23:0] <= {~x1[21], x1[21], x1[21], x1[20:0]};
                neg[0]   <= 1'b0;
            end

            2'b10:
            begin
                pd[23:0] <= {~xn2[21], xn2[21], xn2[21], xn2[20:0]};
                neg[0]   <= 1'b1;
            end

            2'b11:
            begin
                pd[23:0] <= {~xn1[21], xn1[21], xn1[21], xn1[20:0]};
                neg[0]   <= 1'b1;
            end

            default:
            begin
                pd[23:0] <= 24'b0;
                neg[0]   <= 1'b0;
            end
        endcase


        // 第1组：k[3:1]
        case (k[3:1])
            3'b000:
            begin
                pd[46:24] <= {1'b1, 1'b1, 21'b0};
                neg[1]    <= 1'b0;
            end

            3'b001:
            begin
                pd[46:24] <= {1'b1, ~x1[21], x1[20:0]};
                neg[1]    <= 1'b0;
            end

            3'b010:
            begin
                pd[46:24] <= {1'b1, ~x1[21], x1[20:0]};
                neg[1]    <= 1'b0;
            end

            3'b011:
            begin
                pd[46:24] <= {1'b1, ~x2[21], x2[20:0]};
                neg[1]    <= 1'b0;
            end

            3'b100:
            begin
                pd[46:24] <= {1'b1, ~xn2[21], xn2[20:0]};
                neg[1]    <= 1'b1;
            end

            3'b101:
            begin
                pd[46:24] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[1]    <= 1'b1;
            end

            3'b110:
            begin
                pd[46:24] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[1]    <= 1'b1;
            end

            3'b111:
            begin
                pd[46:24] <= {1'b1, 1'b1, 21'b0};
                neg[1]    <= 1'b0;
            end

            default:
            begin
                pd[46:24] <= 23'b0;
                neg[1]    <= 1'b0;
            end
        endcase


        // 第2组：k[5:3]
        case (k[5:3])
            3'b000:
            begin
                pd[69:47] <= {1'b1, 1'b1, 21'b0};
                neg[2]    <= 1'b0;
            end

            3'b001:
            begin
                pd[69:47] <= {1'b1, ~x1[21], x1[20:0]};
                neg[2]    <= 1'b0;
            end

            3'b010:
            begin
                pd[69:47] <= {1'b1, ~x1[21], x1[20:0]};
                neg[2]    <= 1'b0;
            end

            3'b011:
            begin
                pd[69:47] <= {1'b1, ~x2[21], x2[20:0]};
                neg[2]    <= 1'b0;
            end

            3'b100:
            begin
                pd[69:47] <= {1'b1, ~xn2[21], xn2[20:0]};
                neg[2]    <= 1'b1;
            end

            3'b101:
            begin
                pd[69:47] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[2]    <= 1'b1;
            end

            3'b110:
            begin
                pd[69:47] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[2]    <= 1'b1;
            end

            3'b111:
            begin
                pd[69:47] <= {1'b1, 1'b1, 21'b0};
                neg[2]    <= 1'b0;
            end

            default:
            begin
                pd[69:47] <= 23'b0;
                neg[2]    <= 1'b0;
            end
        endcase


        // 第3组：k[7:5]
        case (k[7:5])
            3'b000:
            begin
                pd[92:70] <= {1'b1, 1'b1, 21'b0};
                neg[3]    <= 1'b0;
            end

            3'b001:
            begin
                pd[92:70] <= {1'b1, ~x1[21], x1[20:0]};
                neg[3]    <= 1'b0;
            end

            3'b010:
            begin
                pd[92:70] <= {1'b1, ~x1[21], x1[20:0]};
                neg[3]    <= 1'b0;
            end

            3'b011:
            begin
                pd[92:70] <= {1'b1, ~x2[21], x2[20:0]};
                neg[3]    <= 1'b0;
            end

            3'b100:
            begin
                pd[92:70] <= {1'b1, ~xn2[21], xn2[20:0]};
                neg[3]    <= 1'b1;
            end

            3'b101:
            begin
                pd[92:70] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[3]    <= 1'b1;
            end

            3'b110:
            begin
                pd[92:70] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[3]    <= 1'b1;
            end

            3'b111:
            begin
                pd[92:70] <= {1'b1, 1'b1, 21'b0};
                neg[3]    <= 1'b0;
            end

            default:
            begin
                pd[92:70] <= 23'b0;
                neg[3]    <= 1'b0;
            end
        endcase


        // 第4组：k[9:7]
        case (k[9:7])
            3'b000:
            begin
                pd[115:93] <= {1'b1, 1'b1, 21'b0};
                neg[4]     <= 1'b0;
            end

            3'b001:
            begin
                pd[115:93] <= {1'b1, ~x1[21], x1[20:0]};
                neg[4]     <= 1'b0;
            end

            3'b010:
            begin
                pd[115:93] <= {1'b1, ~x1[21], x1[20:0]};
                neg[4]     <= 1'b0;
            end

            3'b011:
            begin
                pd[115:93] <= {1'b1, ~x2[21], x2[20:0]};
                neg[4]     <= 1'b0;
            end

            3'b100:
            begin
                pd[115:93] <= {1'b1, ~xn2[21], xn2[20:0]};
                neg[4]     <= 1'b1;
            end

            3'b101:
            begin
                pd[115:93] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[4]     <= 1'b1;
            end

            3'b110:
            begin
                pd[115:93] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[4]     <= 1'b1;
            end

            3'b111:
            begin
                pd[115:93] <= {1'b1, 1'b1, 21'b0};
                neg[4]     <= 1'b0;
            end

            default:
            begin
                pd[115:93] <= 23'b0;
                neg[4]     <= 1'b0;
            end
        endcase


        // 第5组：k[11:9]
        case (k[11:9])
            3'b000:
            begin
                pd[138:116] <= {1'b1, 1'b1, 21'b0};
                neg[5]      <= 1'b0;
            end

            3'b001:
            begin
                pd[138:116] <= {1'b1, ~x1[21], x1[20:0]};
                neg[5]      <= 1'b0;
            end

            3'b010:
            begin
                pd[138:116] <= {1'b1, ~x1[21], x1[20:0]};
                neg[5]      <= 1'b0;
            end

            3'b011:
            begin
                pd[138:116] <= {1'b1, ~x2[21], x2[20:0]};
                neg[5]      <= 1'b0;
            end

            3'b100:
            begin
                pd[138:116] <= {1'b1, ~xn2[21], xn2[20:0]};
                neg[5]      <= 1'b1;
            end

            3'b101:
            begin
                pd[138:116] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[5]      <= 1'b1;
            end

            3'b110:
            begin
                pd[138:116] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[5]      <= 1'b1;
            end

            3'b111:
            begin
                pd[138:116] <= {1'b1, 1'b1, 21'b0};
                neg[5]      <= 1'b0;
            end

            default:
            begin
                pd[138:116] <= 23'b0;
                neg[5]      <= 1'b0;
            end
        endcase


        // 第6组：k[13:11]
        case (k[13:11])
            3'b000:
            begin
                pd[161:139] <= {1'b1, 1'b1, 21'b0};
                neg[6]      <= 1'b0;
            end

            3'b001:
            begin
                pd[161:139] <= {1'b1, ~x1[21], x1[20:0]};
                neg[6]      <= 1'b0;
            end

            3'b010:
            begin
                pd[161:139] <= {1'b1, ~x1[21], x1[20:0]};
                neg[6]      <= 1'b0;
            end

            3'b011:
            begin
                pd[161:139] <= {1'b1, ~x2[21], x2[20:0]};
                neg[6]      <= 1'b0;
            end

            3'b100:
            begin
                pd[161:139] <= {1'b1, ~xn2[21], xn2[20:0]};
                neg[6]      <= 1'b1;
            end

            3'b101:
            begin
                pd[161:139] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[6]      <= 1'b1;
            end

            3'b110:
            begin
                pd[161:139] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[6]      <= 1'b1;
            end

            3'b111:
            begin
                pd[161:139] <= {1'b1, 1'b1, 21'b0};
                neg[6]      <= 1'b0;
            end

            default:
            begin
                pd[161:139] <= 23'b0;
                neg[6]      <= 1'b0;
            end
        endcase


        // 第7组：最高位补0，编码为 {1'b0, k[14], k[13]}
        case ({1'b0, k[14], k[13]})
            3'b000:
            begin
                pd[184:162] <= {1'b1, 1'b1, 21'b0};
                neg[7]      <= 1'b0;
            end

            3'b001:
            begin
                pd[184:162] <= {1'b1, ~x1[21], x1[20:0]};
                neg[7]      <= 1'b0;
            end

            3'b010:
            begin
                pd[184:162] <= {1'b1, ~x1[21], x1[20:0]};
                neg[7]      <= 1'b0;
            end

            3'b011:
            begin
                pd[184:162] <= {1'b1, ~x2[21], x2[20:0]};
                neg[7]      <= 1'b0;
            end

            3'b100:
            begin
                pd[184:162] <= {1'b1, ~xn2[21], xn2[20:0]};
                neg[7]      <= 1'b1;
            end

            3'b101:
            begin
                pd[184:162] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[7]      <= 1'b1;
            end

            3'b110:
            begin
                pd[184:162] <= {1'b1, ~xn1[21], xn1[20:0]};
                neg[7]      <= 1'b1;
            end

            3'b111:
            begin
                pd[184:162] <= {1'b1, 1'b1, 21'b0};
                neg[7]      <= 1'b0;
            end

            default:
            begin
                pd[184:162] <= 23'b0;
                neg[7]      <= 1'b0;
            end
        endcase

    end

endmodule
