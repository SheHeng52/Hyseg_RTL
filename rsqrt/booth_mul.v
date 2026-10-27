`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/07 23:15:49
// Design Name: 
// Module Name: booth_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module booth_mul(
    input [42:0] mb,
    input [18:0] x,
    output[37:0] z
);

    wire [20:0] x1;
    wire [20:0] xn1;
    wire [20:0] x2;
    wire [20:0] xn2;

    assign x1  = {2'b0, x};
    assign xn1 = ~x1;
    assign x2  = {1'b0, x, 1'b0};
    assign xn2 = ~x2;

    reg [22:0] pd0;

    reg [21:0] pd1;
    reg [21:0] pd2;
    reg [21:0] pd3;
    reg [21:0] pd4;
    reg [21:0] pd5;
    reg [21:0] pd6;
    reg [21:0] pd7;
    reg [21:0] pd8;
    reg [21:0] pd9;
    reg [21:0] pd10;
    reg [21:0] pd11;
    reg [21:0] pd12;
    reg [21:0] pd13;
    reg [21:0] pd14;

    reg [14:0] neg;


    always @* begin

        // ========================================================
        // pd0
        // mb[1:0]
        // 23 bit
        // ========================================================
        case (mb[1:0])

            2'b00: begin
                pd0   = {1'b1, 1'b0, 1'b0, 20'b0};
                neg[0] = 1'b0;
            end

            2'b01: begin
                pd0   = {~x1[20], x1[20], x1[20], x1[19:0]};
                neg[0] = 1'b0;
            end

            2'b10: begin
                pd0   = {~xn2[20], xn2[20], xn2[20], xn2[19:0]};
                neg[0] = 1'b1;
            end

            2'b11: begin
                pd0   = {~xn1[20], xn1[20], xn1[20], xn1[19:0]};
                neg[0] = 1'b1;
            end

            default: begin
                pd0   = 23'b0;
                neg[0] = 1'b0;
            end

        endcase


        // ========================================================
        // pd1 : mb[4:2]
        // ========================================================
        case (mb[4:2])

            3'b000: begin
                pd1 = {1'b1, 1'b1, 20'b0};
                neg[1] = 1'b0;
            end

            3'b001,
            3'b010: begin
                pd1 = {1'b1, ~x1[20], x1[19:0]};
                neg[1] = 1'b0;
            end

            3'b011: begin
                pd1 = {1'b1, ~x2[20], x2[19:0]};
                neg[1] = 1'b0;
            end

            3'b100: begin
                pd1 = {1'b1, ~xn2[20], xn2[19:0]};
                neg[1] = 1'b1;
            end

            3'b101,
            3'b110: begin
                pd1 = {1'b1, ~xn1[20], xn1[19:0]};
                neg[1] = 1'b1;
            end

            3'b111: begin
                pd1 = {1'b1, 1'b1, 20'b0};
                neg[1] = 1'b0;
            end

            default: begin
                pd1 = 22'b0;
                neg[1] = 1'b0;
            end

        endcase


        // ========================================================
        // pd2 : mb[7:5]
        // ========================================================
        case (mb[7:5])
            3'b000: begin pd2 = {1'b1,1'b1,20'b0};          neg[2] = 0; end
            3'b001,
            3'b010: begin pd2 = {1'b1,~x1[20],x1[19:0]};    neg[2] = 0; end
            3'b011: begin pd2 = {1'b1,~x2[20],x2[19:0]};    neg[2] = 0; end
            3'b100: begin pd2 = {1'b1,~xn2[20],xn2[19:0]};  neg[2] = 1; end
            3'b101,
            3'b110: begin pd2 = {1'b1,~xn1[20],xn1[19:0]};  neg[2] = 1; end
            3'b111: begin pd2 = {1'b1,1'b1,20'b0};          neg[2] = 0; end
            default: begin pd2 = 22'b0;                     neg[2] = 0; end
        endcase


        // pd3 : mb[10:8]
        case (mb[10:8])
            3'b000: begin pd3 = {1'b1,1'b1,20'b0};          neg[3] = 0; end
            3'b001,
            3'b010: begin pd3 = {1'b1,~x1[20],x1[19:0]};    neg[3] = 0; end
            3'b011: begin pd3 = {1'b1,~x2[20],x2[19:0]};    neg[3] = 0; end
            3'b100: begin pd3 = {1'b1,~xn2[20],xn2[19:0]};  neg[3] = 1; end
            3'b101,
            3'b110: begin pd3 = {1'b1,~xn1[20],xn1[19:0]};  neg[3] = 1; end
            3'b111: begin pd3 = {1'b1,1'b1,20'b0};          neg[3] = 0; end
            default: begin pd3 = 22'b0;                     neg[3] = 0; end
        endcase


        // pd4 : mb[13:11]
        case (mb[13:11])
            3'b000: begin pd4 = {1'b1,1'b1,20'b0};          neg[4] = 0; end
            3'b001,
            3'b010: begin pd4 = {1'b1,~x1[20],x1[19:0]};    neg[4] = 0; end
            3'b011: begin pd4 = {1'b1,~x2[20],x2[19:0]};    neg[4] = 0; end
            3'b100: begin pd4 = {1'b1,~xn2[20],xn2[19:0]};  neg[4] = 1; end
            3'b101,
            3'b110: begin pd4 = {1'b1,~xn1[20],xn1[19:0]};  neg[4] = 1; end
            3'b111: begin pd4 = {1'b1,1'b1,20'b0};          neg[4] = 0; end
            default: begin pd4 = 22'b0;                     neg[4] = 0; end
        endcase


        // pd5 : mb[16:14]
        case (mb[16:14])
            3'b000: begin pd5={1'b1,1'b1,20'b0};         neg[5]=0; end
            3'b001,
            3'b010: begin pd5={1'b1,~x1[20],x1[19:0]};   neg[5]=0; end
            3'b011: begin pd5={1'b1,~x2[20],x2[19:0]};   neg[5]=0; end
            3'b100: begin pd5={1'b1,~xn2[20],xn2[19:0]}; neg[5]=1; end
            3'b101,
            3'b110: begin pd5={1'b1,~xn1[20],xn1[19:0]}; neg[5]=1; end
            3'b111: begin pd5={1'b1,1'b1,20'b0};         neg[5]=0; end
            default: begin pd5=22'b0;                    neg[5]=0; end
        endcase


        // pd6 : mb[19:17]
        case (mb[19:17])
            3'b000: begin pd6={1'b1,1'b1,20'b0};         neg[6]=0; end
            3'b001,
            3'b010: begin pd6={1'b1,~x1[20],x1[19:0]};   neg[6]=0; end
            3'b011: begin pd6={1'b1,~x2[20],x2[19:0]};   neg[6]=0; end
            3'b100: begin pd6={1'b1,~xn2[20],xn2[19:0]}; neg[6]=1; end
            3'b101,
            3'b110: begin pd6={1'b1,~xn1[20],xn1[19:0]}; neg[6]=1; end
            3'b111: begin pd6={1'b1,1'b1,20'b0};         neg[6]=0; end
            default: begin pd6=22'b0;                    neg[6]=0; end
        endcase


        // pd7 : mb[22:20]
        case (mb[22:20])
            3'b000: begin pd7={1'b1,1'b1,20'b0};         neg[7]=0; end
            3'b001,
            3'b010: begin pd7={1'b1,~x1[20],x1[19:0]};   neg[7]=0; end
            3'b011: begin pd7={1'b1,~x2[20],x2[19:0]};   neg[7]=0; end
            3'b100: begin pd7={1'b1,~xn2[20],xn2[19:0]}; neg[7]=1; end
            3'b101,
            3'b110: begin pd7={1'b1,~xn1[20],xn1[19:0]}; neg[7]=1; end
            3'b111: begin pd7={1'b1,1'b1,20'b0};         neg[7]=0; end
            default: begin pd7=22'b0;                    neg[7]=0; end
        endcase


        // pd8 : mb[25:23]
        case (mb[25:23])
            3'b000: begin pd8={1'b1,1'b1,20'b0};         neg[8]=0; end
            3'b001,
            3'b010: begin pd8={1'b1,~x1[20],x1[19:0]};   neg[8]=0; end
            3'b011: begin pd8={1'b1,~x2[20],x2[19:0]};   neg[8]=0; end
            3'b100: begin pd8={1'b1,~xn2[20],xn2[19:0]}; neg[8]=1; end
            3'b101,
            3'b110: begin pd8={1'b1,~xn1[20],xn1[19:0]}; neg[8]=1; end
            3'b111: begin pd8={1'b1,1'b1,20'b0};         neg[8]=0; end
            default: begin pd8=22'b0;                    neg[8]=0; end
        endcase


        // pd9 : mb[28:26]
        case (mb[28:26])
            3'b000: begin pd9={1'b1,1'b1,20'b0};         neg[9]=0; end
            3'b001,
            3'b010: begin pd9={1'b1,~x1[20],x1[19:0]};   neg[9]=0; end
            3'b011: begin pd9={1'b1,~x2[20],x2[19:0]};   neg[9]=0; end
            3'b100: begin pd9={1'b1,~xn2[20],xn2[19:0]}; neg[9]=1; end
            3'b101,
            3'b110: begin pd9={1'b1,~xn1[20],xn1[19:0]}; neg[9]=1; end
            3'b111: begin pd9={1'b1,1'b1,20'b0};         neg[9]=0; end
            default: begin pd9=22'b0;                    neg[9]=0; end
        endcase


        // pd10 : mb[31:29]
        case (mb[31:29])
            3'b000: begin pd10={1'b1,1'b1,20'b0};         neg[10]=0; end
            3'b001,
            3'b010: begin pd10={1'b1,~x1[20],x1[19:0]};   neg[10]=0; end
            3'b011: begin pd10={1'b1,~x2[20],x2[19:0]};   neg[10]=0; end
            3'b100: begin pd10={1'b1,~xn2[20],xn2[19:0]}; neg[10]=1; end
            3'b101,
            3'b110: begin pd10={1'b1,~xn1[20],xn1[19:0]}; neg[10]=1; end
            3'b111: begin pd10={1'b1,1'b1,20'b0};         neg[10]=0; end
            default: begin pd10=22'b0;                    neg[10]=0; end
        endcase


        // pd11 : mb[34:32]
        case (mb[34:32])
            3'b000: begin pd11={1'b1,1'b1,20'b0};         neg[11]=0; end
            3'b001,
            3'b010: begin pd11={1'b1,~x1[20],x1[19:0]};   neg[11]=0; end
            3'b011: begin pd11={1'b1,~x2[20],x2[19:0]};   neg[11]=0; end
            3'b100: begin pd11={1'b1,~xn2[20],xn2[19:0]}; neg[11]=1; end
            3'b101,
            3'b110: begin pd11={1'b1,~xn1[20],xn1[19:0]}; neg[11]=1; end
            3'b111: begin pd11={1'b1,1'b1,20'b0};         neg[11]=0; end
            default: begin pd11=22'b0;                    neg[11]=0; end
        endcase


        // pd12 : mb[37:35]
        case (mb[37:35])
            3'b000: begin pd12={1'b1,1'b1,20'b0};         neg[12]=0; end
            3'b001,
            3'b010: begin pd12={1'b1,~x1[20],x1[19:0]};   neg[12]=0; end
            3'b011: begin pd12={1'b1,~x2[20],x2[19:0]};   neg[12]=0; end
            3'b100: begin pd12={1'b1,~xn2[20],xn2[19:0]}; neg[12]=1; end
            3'b101,
            3'b110: begin pd12={1'b1,~xn1[20],xn1[19:0]}; neg[12]=1; end
            3'b111: begin pd12={1'b1,1'b1,20'b0};         neg[12]=0; end
            default: begin pd12=22'b0;                    neg[12]=0; end
        endcase


        // pd13 : mb[40:38]
        case (mb[40:38])
            3'b000: begin pd13={1'b1,1'b1,20'b0};         neg[13]=0; end
            3'b001,
            3'b010: begin pd13={1'b1,~x1[20],x1[19:0]};   neg[13]=0; end
            3'b011: begin pd13={1'b1,~x2[20],x2[19:0]};   neg[13]=0; end
            3'b100: begin pd13={1'b1,~xn2[20],xn2[19:0]}; neg[13]=1; end
            3'b101,
            3'b110: begin pd13={1'b1,~xn1[20],xn1[19:0]}; neg[13]=1; end
            3'b111: begin pd13={1'b1,1'b1,20'b0};         neg[13]=0; end
            default: begin pd13=22'b0;                    neg[13]=0; end
        endcase


        // ========================================================
        // pd14
        // mb 为 signed 时，对最高位进行符号扩展
        // {mb[42], mb[42], mb[41]}
        // ========================================================
        case ({mb[42], mb[42:41]})

            3'b000: begin
                pd14 = {1'b1,1'b1,20'b0};
                neg[14] = 0;
            end

            3'b001,
            3'b010: begin
                pd14 = {1'b1,~x1[20],x1[19:0]};
                neg[14] = 0;
            end

            3'b011: begin
                pd14 = {1'b1,~x2[20],x2[19:0]};
                neg[14] = 0;
            end

            3'b100: begin
                pd14 = {1'b1,~xn2[20],xn2[19:0]};
                neg[14] = 1;
            end

            3'b101,
            3'b110: begin
                pd14 = {1'b1,~xn1[20],xn1[19:0]};
                neg[14] = 1;
            end

            3'b111: begin
                pd14 = {1'b1,1'b1,20'b0};
                neg[14] = 0;
            end

            default: begin
                pd14 = 22'b0;
                neg[14] = 0;
            end

        endcase

    end



	wire			[10:0]			pd0_0;
	wire			[11:0]			pd0_1;
	wire			[13:0]			pd0_2;
	wire			[15:0]			pd0_3;
	wire			[17:0]			pd0_4;
	wire			[19:0]			pd0_5;
	wire			[21:0]			pd0_6;
	wire			[21:0]			pd0_7;
	wire			[21:0]			pd0_8;
	wire			[21:0]			pd0_9;
	wire			[21:0]			pd0_10;
	wire			[21:0]			pd0_11;
	wire			[21:0]			pd0_12;
	wire			[21:0]			pd0_13;
	wire			[21:0]			pd0_14;
	
	
	
	assign pd0_0  = pd0[22:12];
    assign pd0_1  = pd1[21:10];
    assign pd0_2  = pd2[21:8];
    assign pd0_3  = pd3[21:6];
    assign pd0_4  = pd4[21:4];
    assign pd0_5  = pd5[21:2];
    assign pd0_6  = pd6[21:0];
	assign pd0_7  = pd7[21:0];
    assign pd0_8  = pd8[21:0];
    assign pd0_9  = pd9[21:0];
    assign pd0_10 = pd10[21:0];
    assign pd0_11 = pd11[21:0];
    assign pd0_12 = pd12[21:0];
    assign pd0_13 = pd13[21:0];
    assign pd0_14 = pd14[21:0];
    
    
    
    
    wire	[37:0]	pd1_0;
	wire	[35:0]	pd1_1;
	wire	[34:0]	pd1_2;
	wire	[25:0]	pd1_3;
	wire	[27:0]	pd1_4;
	wire	[21:0]	pd1_5;
	wire	[16:0]	pd1_6;
	wire	[9:0]	pd1_7;
	wire	[3:0]	pd1_8;



	wire	[37:0]	pd2_0;
	wire	[34:0]	pd2_1;
	wire	[33:0]	pd2_2;
	wire	[28:0]	pd2_3;
	wire	[17:0]	pd2_4;
	wire	[14:0]	pd2_5;
	wire	[0:0]	pd2_6;



	wire	[37:0]	pd3_0;
	wire	[33:0]	pd3_1;
	wire	[32:0]	pd3_2;
	wire	[25:0]	pd3_3;
	wire	[5:0]	pd3_4;
	wire	[0:0]	pd3_5;



	wire	[37:0]	pd4_0;
	wire	[33:0]	pd4_1;
	wire	[25:0]	pd4_2;
	wire	[5:0]	pd4_3;



	wire	[37:0]	pd5_0;
	wire	[32:0]	pd5_1;
	wire	[13:0]	pd5_2;



	wire	[37:0]	pd6_0;
	wire	[32:0]	pd6_1;



	full_adder	fa_0(
		.a		(pd0_0[0]	),
		.b		(pd0_1[0]	),
		.ci		(pd0_2[0]	),
		.s		(pd1_0[0]	),
		.co		(pd1_0[1]	)
		);
	full_adder	fa_1(
		.a		(pd0_3[0]	),
		.b		(pd0_4[0]	),
		.ci		(pd0_5[0]	),
		.s		(pd1_1[0]	),
		.co		(pd1_1[1]	)
		);
	half_adder	ha_0(
		.a		(pd0_6[0]	),
		.b		(neg[6]	),
		.s		(pd1_2[0]	),
		.co		(pd1_2[1]	)
		);


	full_adder	fa_2(
		.a		(pd0_0[1]	),
		.b		(pd0_1[1]	),
		.ci		(pd0_2[1]	),
		.s		(pd1_3[0]	),
		.co		(pd1_0[2]	)
		);
	full_adder	fa_3(
		.a		(pd0_3[1]	),
		.b		(pd0_4[1]	),
		.ci		(pd0_5[1]	),
		.s		(pd1_4[0]	),
		.co		(pd1_1[2]	)
		);
	assign	pd1_5[0]	=	pd0_6[1];


	full_adder	fa_4(
		.a		(pd0_0[2]	),
		.b		(pd0_1[2]	),
		.ci		(pd0_2[2]	),
		.s		(pd1_2[2]	),
		.co		(pd1_0[3]	)
		);
	full_adder	fa_5(
		.a		(pd0_3[2]	),
		.b		(pd0_4[2]	),
		.ci		(pd0_5[2]	),
		.s		(pd1_3[1]	),
		.co		(pd1_1[3]	)
		);
	full_adder	fa_6(
		.a		(pd0_6[2]	),
		.b		(pd0_7[0]	),
		.ci		(neg[7]	),
		.s		(pd1_4[1]	),
		.co		(pd1_2[3]	)
		);


	full_adder	fa_7(
		.a		(pd0_0[3]	),
		.b		(pd0_1[3]	),
		.ci		(pd0_2[3]	),
		.s		(pd1_3[2]	),
		.co		(pd1_0[4]	)
		);
	full_adder	fa_8(
		.a		(pd0_3[3]	),
		.b		(pd0_4[3]	),
		.ci		(pd0_5[3]	),
		.s		(pd1_4[2]	),
		.co		(pd1_1[4]	)
		);
	half_adder	ha_1(
		.a		(pd0_6[3]	),
		.b		(pd0_7[1]	),
		.s		(pd1_5[1]	),
		.co		(pd1_2[4]	)
		);


	full_adder	fa_9(
		.a		(pd0_0[4]	),
		.b		(pd0_1[4]	),
		.ci		(pd0_2[4]	),
		.s		(pd1_3[3]	),
		.co		(pd1_0[5]	)
		);
	full_adder	fa_10(
		.a		(pd0_3[4]	),
		.b		(pd0_4[4]	),
		.ci		(pd0_5[4]	),
		.s		(pd1_4[3]	),
		.co		(pd1_1[5]	)
		);
	full_adder	fa_11(
		.a		(pd0_6[4]	),
		.b		(pd0_7[2]	),
		.ci		(pd0_8[0]	),
		.s		(pd1_5[2]	),
		.co		(pd1_2[5]	)
		);


	full_adder	fa_12(
		.a		(pd0_0[5]	),
		.b		(pd0_1[5]	),
		.ci		(pd0_2[5]	),
		.s		(pd1_3[4]	),
		.co		(pd1_0[6]	)
		);
	full_adder	fa_13(
		.a		(pd0_3[5]	),
		.b		(pd0_4[5]	),
		.ci		(pd0_5[5]	),
		.s		(pd1_4[4]	),
		.co		(pd1_1[6]	)
		);
	full_adder	fa_14(
		.a		(pd0_6[5]	),
		.b		(pd0_7[3]	),
		.ci		(pd0_8[1]	),
		.s		(pd1_5[3]	),
		.co		(pd1_2[6]	)
		);


	full_adder	fa_15(
		.a		(pd0_0[6]	),
		.b		(pd0_1[6]	),
		.ci		(pd0_2[6]	),
		.s		(pd1_3[5]	),
		.co		(pd1_0[7]	)
		);
	full_adder	fa_16(
		.a		(pd0_3[6]	),
		.b		(pd0_4[6]	),
		.ci		(pd0_5[6]	),
		.s		(pd1_4[5]	),
		.co		(pd1_1[7]	)
		);
	full_adder	fa_17(
		.a		(pd0_6[6]	),
		.b		(pd0_7[4]	),
		.ci		(pd0_8[2]	),
		.s		(pd1_5[4]	),
		.co		(pd1_2[7]	)
		);
	half_adder	ha_2(
		.a		(pd0_9[0]	),
		.b		(neg[9]	),
		.s		(pd1_6[0]	),
		.co		(pd1_3[6]	)
		);


	full_adder	fa_18(
		.a		(pd0_0[7]	),
		.b		(pd0_1[7]	),
		.ci		(pd0_2[7]	),
		.s		(pd1_4[6]	),
		.co		(pd1_0[8]	)
		);
	full_adder	fa_19(
		.a		(pd0_3[7]	),
		.b		(pd0_4[7]	),
		.ci		(pd0_5[7]	),
		.s		(pd1_5[5]	),
		.co		(pd1_1[8]	)
		);
	full_adder	fa_20(
		.a		(pd0_6[7]	),
		.b		(pd0_7[5]	),
		.ci		(pd0_8[3]	),
		.s		(pd1_6[1]	),
		.co		(pd1_2[8]	)
		);
	assign	pd1_7[0]	=	pd0_9[1];


	full_adder	fa_21(
		.a		(pd0_0[8]	),
		.b		(pd0_1[8]	),
		.ci		(pd0_2[8]	),
		.s		(pd1_3[7]	),
		.co		(pd1_0[9]	)
		);
	full_adder	fa_22(
		.a		(pd0_3[8]	),
		.b		(pd0_4[8]	),
		.ci		(pd0_5[8]	),
		.s		(pd1_4[7]	),
		.co		(pd1_1[9]	)
		);
	full_adder	fa_23(
		.a		(pd0_6[8]	),
		.b		(pd0_7[6]	),
		.ci		(pd0_8[4]	),
		.s		(pd1_5[6]	),
		.co		(pd1_2[9]	)
		);
	full_adder	fa_24(
		.a		(pd0_9[2]	),
		.b		(pd0_10[0]	),
		.ci		(neg[10]	),
		.s		(pd1_6[2]	),
		.co		(pd1_3[8]	)
		);


	full_adder	fa_25(
		.a		(pd0_0[9]	),
		.b		(pd0_1[9]	),
		.ci		(pd0_2[9]	),
		.s		(pd1_4[8]	),
		.co		(pd1_0[10]	)
		);
	full_adder	fa_26(
		.a		(pd0_3[9]	),
		.b		(pd0_4[9]	),
		.ci		(pd0_5[9]	),
		.s		(pd1_5[7]	),
		.co		(pd1_1[10]	)
		);
	full_adder	fa_27(
		.a		(pd0_6[9]	),
		.b		(pd0_7[7]	),
		.ci		(pd0_8[5]	),
		.s		(pd1_6[3]	),
		.co		(pd1_2[10]	)
		);
	half_adder	ha_3(
		.a		(pd0_9[3]	),
		.b		(pd0_10[1]	),
		.s		(pd1_7[1]	),
		.co		(pd1_3[9]	)
		);


	full_adder	fa_28(
		.a		(pd0_0[10]	),
		.b		(pd0_1[10]	),
		.ci		(pd0_2[10]	),
		.s		(pd1_4[9]	),
		.co		(pd1_0[11]	)
		);
	full_adder	fa_29(
		.a		(pd0_3[10]	),
		.b		(pd0_4[10]	),
		.ci		(pd0_5[10]	),
		.s		(pd1_5[8]	),
		.co		(pd1_1[11]	)
		);
	full_adder	fa_30(
		.a		(pd0_6[10]	),
		.b		(pd0_7[8]	),
		.ci		(pd0_8[6]	),
		.s		(pd1_6[4]	),
		.co		(pd1_2[11]	)
		);
	full_adder	fa_31(
		.a		(pd0_9[4]	),
		.b		(pd0_10[2]	),
		.ci		(pd0_11[0]	),
		.s		(pd1_7[2]	),
		.co		(pd1_3[10]	)
		);


	assign	pd1_4[10]	=	pd0_11[1];
	full_adder	fa_32(
		.a		(pd0_10[3]	),
		.b		(pd0_9[5]	),
		.ci		(pd0_8[7]	),
		.s		(pd1_5[9]	),
		.co		(pd1_0[12]	)
		);
	full_adder	fa_33(
		.a		(pd0_7[9]	),
		.b		(pd0_6[11]	),
		.ci		(pd0_5[11]	),
		.s		(pd1_6[5]	),
		.co		(pd1_1[12]	)
		);
	full_adder	fa_34(
		.a		(pd0_4[11]	),
		.b		(pd0_3[11]	),
		.ci		(pd0_2[11]	),
		.s		(pd1_7[3]	),
		.co		(pd1_2[12]	)
		);
	assign	pd1_8[0]	=	pd0_1[11];


	full_adder	fa_35(
		.a		(pd0_12[0]	),
		.b		(pd0_11[2]	),
		.ci		(pd0_10[4]	),
		.s		(pd1_4[11]	),
		.co		(pd1_0[13]	)
		);
	full_adder	fa_36(
		.a		(pd0_9[6]	),
		.b		(pd0_8[8]	),
		.ci		(pd0_7[10]	),
		.s		(pd1_5[10]	),
		.co		(pd1_1[13]	)
		);
	full_adder	fa_37(
		.a		(pd0_6[12]	),
		.b		(pd0_5[12]	),
		.ci		(pd0_4[12]	),
		.s		(pd1_6[6]	),
		.co		(pd1_2[13]	)
		);
	half_adder	ha_4(
		.a		(pd0_3[12]	),
		.b		(pd0_2[12]	),
		.s		(pd1_7[4]	),
		.co		(pd1_3[11]	)
		);


	assign	pd1_4[12]	=	pd0_12[1];
	full_adder	fa_38(
		.a		(pd0_11[3]	),
		.b		(pd0_10[5]	),
		.ci		(pd0_9[7]	),
		.s		(pd1_5[11]	),
		.co		(pd1_0[14]	)
		);
	full_adder	fa_39(
		.a		(pd0_8[9]	),
		.b		(pd0_7[11]	),
		.ci		(pd0_6[13]	),
		.s		(pd1_6[7]	),
		.co		(pd1_1[14]	)
		);
	full_adder	fa_40(
		.a		(pd0_5[13]	),
		.b		(pd0_4[13]	),
		.ci		(pd0_3[13]	),
		.s		(pd1_7[5]	),
		.co		(pd1_2[14]	)
		);
	assign	pd1_8[1]	=	pd0_2[13];


	full_adder	fa_41(
		.a		(pd0_13[0]	),
		.b		(pd0_12[2]	),
		.ci		(pd0_11[4]	),
		.s		(pd1_4[13]	),
		.co		(pd1_0[15]	)
		);
	full_adder	fa_42(
		.a		(pd0_10[6]	),
		.b		(pd0_9[8]	),
		.ci		(pd0_8[10]	),
		.s		(pd1_5[12]	),
		.co		(pd1_1[15]	)
		);
	full_adder	fa_43(
		.a		(pd0_7[12]	),
		.b		(pd0_6[14]	),
		.ci		(pd0_5[14]	),
		.s		(pd1_6[8]	),
		.co		(pd1_2[15]	)
		);
	half_adder	ha_5(
		.a		(pd0_4[14]	),
		.b		(pd0_3[14]	),
		.s		(pd1_7[6]	),
		.co		(pd1_3[12]	)
		);


	assign	pd1_4[14]	=	pd0_13[1];
	full_adder	fa_44(
		.a		(pd0_12[3]	),
		.b		(pd0_11[5]	),
		.ci		(pd0_10[7]	),
		.s		(pd1_5[13]	),
		.co		(pd1_0[16]	)
		);
	full_adder	fa_45(
		.a		(pd0_9[9]	),
		.b		(pd0_8[11]	),
		.ci		(pd0_7[13]	),
		.s		(pd1_6[9]	),
		.co		(pd1_1[16]	)
		);
	full_adder	fa_46(
		.a		(pd0_6[15]	),
		.b		(pd0_5[15]	),
		.ci		(pd0_4[15]	),
		.s		(pd1_7[7]	),
		.co		(pd1_2[16]	)
		);
	assign	pd1_8[2]	=	pd0_3[15];


	full_adder	fa_47(
		.a		(pd0_14[0]	),
		.b		(pd0_13[2]	),
		.ci		(pd0_12[4]	),
		.s		(pd1_4[15]	),
		.co		(pd1_0[17]	)
		);
	full_adder	fa_48(
		.a		(pd0_11[6]	),
		.b		(pd0_10[8]	),
		.ci		(pd0_9[10]	),
		.s		(pd1_5[14]	),
		.co		(pd1_1[17]	)
		);
	full_adder	fa_49(
		.a		(pd0_8[12]	),
		.b		(pd0_7[14]	),
		.ci		(pd0_6[16]	),
		.s		(pd1_6[10]	),
		.co		(pd1_2[17]	)
		);
	half_adder	ha_6(
		.a		(pd0_5[16]	),
		.b		(pd0_4[16]	),
		.s		(pd1_7[8]	),
		.co		(pd1_3[13]	)
		);


	assign	pd1_4[16]	=	pd0_14[1];
	full_adder	fa_50(
		.a		(pd0_13[3]	),
		.b		(pd0_12[5]	),
		.ci		(pd0_11[7]	),
		.s		(pd1_5[15]	),
		.co		(pd1_0[18]	)
		);
	full_adder	fa_51(
		.a		(pd0_10[9]	),
		.b		(pd0_9[11]	),
		.ci		(pd0_8[13]	),
		.s		(pd1_6[11]	),
		.co		(pd1_1[18]	)
		);
	full_adder	fa_52(
		.a		(pd0_7[15]	),
		.b		(pd0_6[17]	),
		.ci		(pd0_5[17]	),
		.s		(pd1_7[9]	),
		.co		(pd1_2[18]	)
		);
	assign	pd1_8[3]	=	pd0_4[17];


	assign	pd1_3[14]	=	pd0_14[2];
	full_adder	fa_53(
		.a		(pd0_13[4]	),
		.b		(pd0_12[6]	),
		.ci		(pd0_11[8]	),
		.s		(pd1_4[17]	),
		.co		(pd1_0[19]	)
		);
	full_adder	fa_54(
		.a		(pd0_10[10]	),
		.b		(pd0_9[12]	),
		.ci		(pd0_8[14]	),
		.s		(pd1_5[16]	),
		.co		(pd1_1[19]	)
		);
	full_adder	fa_55(
		.a		(pd0_7[16]	),
		.b		(pd0_6[18]	),
		.ci		(pd0_5[18]	),
		.s		(pd1_6[12]	),
		.co		(pd1_2[19]	)
		);


	assign	pd1_3[15]	=	pd0_14[3];
	full_adder	fa_56(
		.a		(pd0_13[5]	),
		.b		(pd0_12[7]	),
		.ci		(pd0_11[9]	),
		.s		(pd1_4[18]	),
		.co		(pd1_0[20]	)
		);
	full_adder	fa_57(
		.a		(pd0_10[11]	),
		.b		(pd0_9[13]	),
		.ci		(pd0_8[15]	),
		.s		(pd1_5[17]	),
		.co		(pd1_1[20]	)
		);
	full_adder	fa_58(
		.a		(pd0_7[17]	),
		.b		(pd0_6[19]	),
		.ci		(pd0_5[19]	),
		.s		(pd1_6[13]	),
		.co		(pd1_2[20]	)
		);


	assign	pd1_3[16]	=	pd0_14[4];
	full_adder	fa_59(
		.a		(pd0_13[6]	),
		.b		(pd0_12[8]	),
		.ci		(pd0_11[10]	),
		.s		(pd1_4[19]	),
		.co		(pd1_0[21]	)
		);
	full_adder	fa_60(
		.a		(pd0_10[12]	),
		.b		(pd0_9[14]	),
		.ci		(pd0_8[16]	),
		.s		(pd1_5[18]	),
		.co		(pd1_1[21]	)
		);
	half_adder	ha_7(
		.a		(pd0_7[18]	),
		.b		(pd0_6[20]	),
		.s		(pd1_6[14]	),
		.co		(pd1_2[21]	)
		);


	assign	pd1_3[17]	=	pd0_14[5];
	full_adder	fa_61(
		.a		(pd0_13[7]	),
		.b		(pd0_12[9]	),
		.ci		(pd0_11[11]	),
		.s		(pd1_4[20]	),
		.co		(pd1_0[22]	)
		);
	full_adder	fa_62(
		.a		(pd0_10[13]	),
		.b		(pd0_9[15]	),
		.ci		(pd0_8[17]	),
		.s		(pd1_5[19]	),
		.co		(pd1_1[22]	)
		);
	half_adder	ha_8(
		.a		(pd0_7[19]	),
		.b		(pd0_6[21]	),
		.s		(pd1_6[15]	),
		.co		(pd1_2[22]	)
		);


	assign	pd1_3[18]	=	pd0_14[6];
	full_adder	fa_63(
		.a		(pd0_13[8]	),
		.b		(pd0_12[10]	),
		.ci		(pd0_11[12]	),
		.s		(pd1_4[21]	),
		.co		(pd1_0[23]	)
		);
	full_adder	fa_64(
		.a		(pd0_10[14]	),
		.b		(pd0_9[16]	),
		.ci		(pd0_8[18]	),
		.s		(pd1_5[20]	),
		.co		(pd1_1[23]	)
		);
	assign	pd1_6[16]	=	pd0_7[20];


	assign	pd1_2[23]	=	pd0_14[7];
	full_adder	fa_65(
		.a		(pd0_13[9]	),
		.b		(pd0_12[11]	),
		.ci		(pd0_11[13]	),
		.s		(pd1_3[19]	),
		.co		(pd1_0[24]	)
		);
	full_adder	fa_66(
		.a		(pd0_10[15]	),
		.b		(pd0_9[17]	),
		.ci		(pd0_8[19]	),
		.s		(pd1_4[22]	),
		.co		(pd1_1[24]	)
		);
	assign	pd1_5[21]	=	pd0_7[21];


	assign	pd1_2[24]	=	pd0_14[8];
	full_adder	fa_67(
		.a		(pd0_13[10]	),
		.b		(pd0_12[12]	),
		.ci		(pd0_11[14]	),
		.s		(pd1_3[20]	),
		.co		(pd1_0[25]	)
		);
	full_adder	fa_68(
		.a		(pd0_10[16]	),
		.b		(pd0_9[18]	),
		.ci		(pd0_8[20]	),
		.s		(pd1_4[23]	),
		.co		(pd1_1[25]	)
		);


	assign	pd1_2[25]	=	pd0_14[9];
	full_adder	fa_69(
		.a		(pd0_13[11]	),
		.b		(pd0_12[13]	),
		.ci		(pd0_11[15]	),
		.s		(pd1_3[21]	),
		.co		(pd1_0[26]	)
		);
	full_adder	fa_70(
		.a		(pd0_10[17]	),
		.b		(pd0_9[19]	),
		.ci		(pd0_8[21]	),
		.s		(pd1_4[24]	),
		.co		(pd1_1[26]	)
		);


	assign	pd1_2[26]	=	pd0_14[10];
	full_adder	fa_71(
		.a		(pd0_13[12]	),
		.b		(pd0_12[14]	),
		.ci		(pd0_11[16]	),
		.s		(pd1_3[22]	),
		.co		(pd1_0[27]	)
		);
	half_adder	ha_9(
		.a		(pd0_10[18]	),
		.b		(pd0_9[20]	),
		.s		(pd1_4[25]	),
		.co		(pd1_1[27]	)
		);


	assign	pd1_2[27]	=	pd0_14[11];
	full_adder	fa_72(
		.a		(pd0_13[13]	),
		.b		(pd0_12[15]	),
		.ci		(pd0_11[17]	),
		.s		(pd1_3[23]	),
		.co		(pd1_0[28]	)
		);
	half_adder	ha_10(
		.a		(pd0_10[19]	),
		.b		(pd0_9[21]	),
		.s		(pd1_4[26]	),
		.co		(pd1_1[28]	)
		);


	assign	pd1_2[28]	=	pd0_14[12];
	full_adder	fa_73(
		.a		(pd0_13[14]	),
		.b		(pd0_12[16]	),
		.ci		(pd0_11[18]	),
		.s		(pd1_3[24]	),
		.co		(pd1_0[29]	)
		);
	assign	pd1_4[27]	=	pd0_10[20];


	assign	pd1_1[29]	=	pd0_14[13];
	full_adder	fa_74(
		.a		(pd0_13[15]	),
		.b		(pd0_12[17]	),
		.ci		(pd0_11[19]	),
		.s		(pd1_2[29]	),
		.co		(pd1_0[30]	)
		);
	assign	pd1_3[25]	=	pd0_10[21];


	assign	pd1_1[30]	=	pd0_14[14];
	full_adder	fa_75(
		.a		(pd0_13[16]	),
		.b		(pd0_12[18]	),
		.ci		(pd0_11[20]	),
		.s		(pd1_2[30]	),
		.co		(pd1_0[31]	)
		);


	assign	pd1_1[31]	=	pd0_14[15];
	full_adder	fa_76(
		.a		(pd0_13[17]	),
		.b		(pd0_12[19]	),
		.ci		(pd0_11[21]	),
		.s		(pd1_2[31]	),
		.co		(pd1_0[32]	)
		);


	assign	pd1_1[32]	=	pd0_14[16];
	half_adder	ha_11(
		.a		(pd0_13[18]	),
		.b		(pd0_12[20]	),
		.s		(pd1_2[32]	),
		.co		(pd1_0[33]	)
		);


	assign	pd1_1[33]	=	pd0_14[17];
	half_adder	ha_12(
		.a		(pd0_13[19]	),
		.b		(pd0_12[21]	),
		.s		(pd1_2[33]	),
		.co		(pd1_0[34]	)
		);


	assign	pd1_1[34]	=	pd0_14[18];
	assign	pd1_2[34]	=	pd0_13[20];


	assign	pd1_0[35]	=	pd0_14[19];
	assign	pd1_1[35]	=	pd0_13[21];


	assign	pd1_0[36]	=	pd0_14[20];


	assign	pd1_0[37]	=	pd0_14[21];






















	full_adder	fa_77(
		.a		(pd1_0[0]	),
		.b		(pd1_1[0]	),
		.ci		(pd1_2[0]	),
		.s		(pd2_0[0]	),
		.co		(pd2_0[1]	)
		);


	full_adder	fa_78(
		.a		(pd1_0[1]	),
		.b		(pd1_1[1]	),
		.ci		(pd1_2[1]	),
		.s		(pd2_1[0]	),
		.co		(pd2_0[2]	)
		);
	full_adder	fa_79(
		.a		(pd1_3[0]	),
		.b		(pd1_4[0]	),
		.ci		(pd1_5[0]	),
		.s		(pd2_2[0]	),
		.co		(pd2_1[1]	)
		);


	full_adder	fa_80(
		.a		(pd1_0[2]	),
		.b		(pd1_1[2]	),
		.ci		(pd1_2[2]	),
		.s		(pd2_2[1]	),
		.co		(pd2_0[3]	)
		);
	half_adder	ha_13(
		.a		(pd1_3[1]	),
		.b		(pd1_4[1]	),
		.s		(pd2_3[0]	),
		.co		(pd2_1[2]	)
		);


	full_adder	fa_81(
		.a		(pd1_0[3]	),
		.b		(pd1_1[3]	),
		.ci		(pd1_2[3]	),
		.s		(pd2_2[2]	),
		.co		(pd2_0[4]	)
		);
	full_adder	fa_82(
		.a		(pd1_3[2]	),
		.b		(pd1_4[2]	),
		.ci		(pd1_5[1]	),
		.s		(pd2_3[1]	),
		.co		(pd2_1[3]	)
		);


	full_adder	fa_83(
		.a		(pd1_0[4]	),
		.b		(pd1_1[4]	),
		.ci		(pd1_2[4]	),
		.s		(pd2_2[3]	),
		.co		(pd2_0[5]	)
		);
	full_adder	fa_84(
		.a		(pd1_3[3]	),
		.b		(pd1_4[3]	),
		.ci		(pd1_5[2]	),
		.s		(pd2_3[2]	),
		.co		(pd2_1[4]	)
		);


	full_adder	fa_85(
		.a		(pd1_0[5]	),
		.b		(pd1_1[5]	),
		.ci		(pd1_2[5]	),
		.s		(pd2_2[4]	),
		.co		(pd2_0[6]	)
		);
	full_adder	fa_86(
		.a		(pd1_3[4]	),
		.b		(pd1_4[4]	),
		.ci		(pd1_5[3]	),
		.s		(pd2_3[3]	),
		.co		(pd2_1[5]	)
		);


	full_adder	fa_87(
		.a		(pd1_0[6]	),
		.b		(pd1_1[6]	),
		.ci		(pd1_2[6]	),
		.s		(pd2_2[5]	),
		.co		(pd2_0[7]	)
		);
	full_adder	fa_88(
		.a		(pd1_3[5]	),
		.b		(pd1_4[5]	),
		.ci		(pd1_5[4]	),
		.s		(pd2_3[4]	),
		.co		(pd2_1[6]	)
		);
	assign	pd2_4[0]	=	pd1_6[0];


	full_adder	fa_89(
		.a		(pd1_0[7]	),
		.b		(pd1_1[7]	),
		.ci		(pd1_2[7]	),
		.s		(pd2_2[6]	),
		.co		(pd2_0[8]	)
		);
	full_adder	fa_90(
		.a		(pd1_3[6]	),
		.b		(pd1_4[6]	),
		.ci		(pd1_5[5]	),
		.s		(pd2_3[5]	),
		.co		(pd2_1[7]	)
		);
	half_adder	ha_14(
		.a		(pd1_6[1]	),
		.b		(pd1_7[0]	),
		.s		(pd2_4[1]	),
		.co		(pd2_2[7]	)
		);


	full_adder	fa_91(
		.a		(pd1_0[8]	),
		.b		(pd1_1[8]	),
		.ci		(pd1_2[8]	),
		.s		(pd2_3[6]	),
		.co		(pd2_0[9]	)
		);
	full_adder	fa_92(
		.a		(pd1_3[7]	),
		.b		(pd1_4[7]	),
		.ci		(pd1_5[6]	),
		.s		(pd2_4[2]	),
		.co		(pd2_1[8]	)
		);
	assign	pd2_5[0]	=	pd1_6[2];


	full_adder	fa_93(
		.a		(pd1_0[9]	),
		.b		(pd1_1[9]	),
		.ci		(pd1_2[9]	),
		.s		(pd2_2[8]	),
		.co		(pd2_0[10]	)
		);
	full_adder	fa_94(
		.a		(pd1_3[8]	),
		.b		(pd1_4[8]	),
		.ci		(pd1_5[7]	),
		.s		(pd2_3[7]	),
		.co		(pd2_1[9]	)
		);
	half_adder	ha_15(
		.a		(pd1_6[3]	),
		.b		(pd1_7[1]	),
		.s		(pd2_4[3]	),
		.co		(pd2_2[9]	)
		);


	full_adder	fa_95(
		.a		(pd1_0[10]	),
		.b		(pd1_1[10]	),
		.ci		(pd1_2[10]	),
		.s		(pd2_3[8]	),
		.co		(pd2_0[11]	)
		);
	full_adder	fa_96(
		.a		(pd1_3[9]	),
		.b		(pd1_4[9]	),
		.ci		(pd1_5[8]	),
		.s		(pd2_4[4]	),
		.co		(pd2_1[10]	)
		);
	full_adder	fa_97(
		.a		(pd1_6[4]	),
		.b		(pd1_7[2]	),
		.ci		(neg[11]	),
		.s		(pd2_5[1]	),
		.co		(pd2_2[10]	)
		);


	full_adder	fa_98(
		.a		(pd1_0[11]	),
		.b		(pd1_1[11]	),
		.ci		(pd1_2[11]	),
		.s		(pd2_3[9]	),
		.co		(pd2_0[12]	)
		);
	full_adder	fa_99(
		.a		(pd1_3[10]	),
		.b		(pd1_4[10]	),
		.ci		(pd1_5[9]	),
		.s		(pd2_4[5]	),
		.co		(pd2_1[11]	)
		);
	full_adder	fa_100(
		.a		(pd1_6[5]	),
		.b		(pd1_7[3]	),
		.ci		(pd1_8[0]	),
		.s		(pd2_5[2]	),
		.co		(pd2_2[11]	)
		);


	full_adder	fa_101(
		.a		(pd1_0[12]	),
		.b		(pd1_1[12]	),
		.ci		(pd1_2[12]	),
		.s		(pd2_3[10]	),
		.co		(pd2_0[13]	)
		);
	full_adder	fa_102(
		.a		(neg[12]	),
		.b		(pd1_4[11]	),
		.ci		(pd1_5[10]	),
		.s		(pd2_4[6]	),
		.co		(pd2_1[12]	)
		);
	half_adder	ha_16(
		.a		(pd1_6[6]	),
		.b		(pd1_7[4]	),
		.s		(pd2_5[3]	),
		.co		(pd2_2[12]	)
		);


	full_adder	fa_103(
		.a		(pd1_0[13]	),
		.b		(pd1_1[13]	),
		.ci		(pd1_2[13]	),
		.s		(pd2_3[11]	),
		.co		(pd2_0[14]	)
		);
	full_adder	fa_104(
		.a		(pd1_3[11]	),
		.b		(pd1_4[12]	),
		.ci		(pd1_5[11]	),
		.s		(pd2_4[7]	),
		.co		(pd2_1[13]	)
		);
	full_adder	fa_105(
		.a		(pd1_6[7]	),
		.b		(pd1_7[5]	),
		.ci		(pd1_8[1]	),
		.s		(pd2_5[4]	),
		.co		(pd2_2[13]	)
		);


	full_adder	fa_106(
		.a		(pd1_0[14]	),
		.b		(pd1_1[14]	),
		.ci		(pd1_2[14]	),
		.s		(pd2_3[12]	),
		.co		(pd2_0[15]	)
		);
	full_adder	fa_107(
		.a		(neg[13]	),
		.b		(pd1_4[13]	),
		.ci		(pd1_5[12]	),
		.s		(pd2_4[8]	),
		.co		(pd2_1[14]	)
		);
	half_adder	ha_17(
		.a		(pd1_6[8]	),
		.b		(pd1_7[6]	),
		.s		(pd2_5[5]	),
		.co		(pd2_2[14]	)
		);


	full_adder	fa_108(
		.a		(pd1_0[15]	),
		.b		(pd1_1[15]	),
		.ci		(pd1_2[15]	),
		.s		(pd2_3[13]	),
		.co		(pd2_0[16]	)
		);
	full_adder	fa_109(
		.a		(pd1_3[12]	),
		.b		(pd1_4[14]	),
		.ci		(pd1_5[13]	),
		.s		(pd2_4[9]	),
		.co		(pd2_1[15]	)
		);
	full_adder	fa_110(
		.a		(pd1_6[9]	),
		.b		(pd1_7[7]	),
		.ci		(pd1_8[2]	),
		.s		(pd2_5[6]	),
		.co		(pd2_2[15]	)
		);


	full_adder	fa_111(
		.a		(pd1_0[16]	),
		.b		(pd1_1[16]	),
		.ci		(pd1_2[16]	),
		.s		(pd2_3[14]	),
		.co		(pd2_0[17]	)
		);
	full_adder	fa_112(
		.a		(neg[14]	),
		.b		(pd1_4[15]	),
		.ci		(pd1_5[14]	),
		.s		(pd2_4[10]	),
		.co		(pd2_1[16]	)
		);
	half_adder	ha_18(
		.a		(pd1_6[10]	),
		.b		(pd1_7[8]	),
		.s		(pd2_5[7]	),
		.co		(pd2_2[16]	)
		);


	full_adder	fa_113(
		.a		(pd1_0[17]	),
		.b		(pd1_1[17]	),
		.ci		(pd1_2[17]	),
		.s		(pd2_3[15]	),
		.co		(pd2_0[18]	)
		);
	full_adder	fa_114(
		.a		(pd1_3[13]	),
		.b		(pd1_4[16]	),
		.ci		(pd1_5[15]	),
		.s		(pd2_4[11]	),
		.co		(pd2_1[17]	)
		);
	full_adder	fa_115(
		.a		(pd1_6[11]	),
		.b		(pd1_7[9]	),
		.ci		(pd1_8[3]	),
		.s		(pd2_5[8]	),
		.co		(pd2_2[17]	)
		);


	assign	pd2_3[16]	=	pd1_6[12];
	assign	pd2_4[12]	=	pd1_5[16];
	full_adder	fa_116(
		.a		(pd1_4[17]	),
		.b		(pd1_3[14]	),
		.ci		(pd1_2[18]	),
		.s		(pd2_5[9]	),
		.co		(pd2_0[19]	)
		);
	half_adder	ha_19(
		.a		(pd1_1[18]	),
		.b		(pd1_0[18]	),
		.s		(pd2_6[0]	),
		.co		(pd2_1[18]	)
		);


	assign	pd2_2[18]	=	pd1_6[13];
	assign	pd2_3[17]	=	pd1_5[17];
	full_adder	fa_117(
		.a		(pd1_4[18]	),
		.b		(pd1_3[15]	),
		.ci		(pd1_2[19]	),
		.s		(pd2_4[13]	),
		.co		(pd2_0[20]	)
		);
	half_adder	ha_20(
		.a		(pd1_1[19]	),
		.b		(pd1_0[19]	),
		.s		(pd2_5[10]	),
		.co		(pd2_1[19]	)
		);


	assign	pd2_2[19]	=	pd1_6[14];
	assign	pd2_3[18]	=	pd1_5[18];
	full_adder	fa_118(
		.a		(pd1_4[19]	),
		.b		(pd1_3[16]	),
		.ci		(pd1_2[20]	),
		.s		(pd2_4[14]	),
		.co		(pd2_0[21]	)
		);
	half_adder	ha_21(
		.a		(pd1_1[20]	),
		.b		(pd1_0[20]	),
		.s		(pd2_5[11]	),
		.co		(pd2_1[20]	)
		);


	assign	pd2_2[20]	=	pd1_6[15];
	assign	pd2_3[19]	=	pd1_5[19];
	full_adder	fa_119(
		.a		(pd1_4[20]	),
		.b		(pd1_3[17]	),
		.ci		(pd1_2[21]	),
		.s		(pd2_4[15]	),
		.co		(pd2_0[22]	)
		);
	half_adder	ha_22(
		.a		(pd1_1[21]	),
		.b		(pd1_0[21]	),
		.s		(pd2_5[12]	),
		.co		(pd2_1[21]	)
		);


	assign	pd2_2[21]	=	pd1_6[16];
	assign	pd2_3[20]	=	pd1_5[20];
	full_adder	fa_120(
		.a		(pd1_4[21]	),
		.b		(pd1_3[18]	),
		.ci		(pd1_2[22]	),
		.s		(pd2_4[16]	),
		.co		(pd2_0[23]	)
		);
	half_adder	ha_23(
		.a		(pd1_1[22]	),
		.b		(pd1_0[22]	),
		.s		(pd2_5[13]	),
		.co		(pd2_1[22]	)
		);


	assign	pd2_2[22]	=	pd1_5[21];
	assign	pd2_3[21]	=	pd1_4[22];
	full_adder	fa_121(
		.a		(pd1_3[19]	),
		.b		(pd1_2[23]	),
		.ci		(pd1_1[23]	),
		.s		(pd2_4[17]	),
		.co		(pd2_0[24]	)
		);
	assign	pd2_5[14]	=	pd1_0[23];


	assign	pd2_1[23]	=	pd1_4[23];
	assign	pd2_2[23]	=	pd1_3[20];
	full_adder	fa_122(
		.a		(pd1_2[24]	),
		.b		(pd1_1[24]	),
		.ci		(pd1_0[24]	),
		.s		(pd2_3[22]	),
		.co		(pd2_0[25]	)
		);


	assign	pd2_1[24]	=	pd1_4[24];
	assign	pd2_2[24]	=	pd1_3[21];
	full_adder	fa_123(
		.a		(pd1_2[25]	),
		.b		(pd1_1[25]	),
		.ci		(pd1_0[25]	),
		.s		(pd2_3[23]	),
		.co		(pd2_0[26]	)
		);


	assign	pd2_1[25]	=	pd1_4[25];
	assign	pd2_2[25]	=	pd1_3[22];
	full_adder	fa_124(
		.a		(pd1_2[26]	),
		.b		(pd1_1[26]	),
		.ci		(pd1_0[26]	),
		.s		(pd2_3[24]	),
		.co		(pd2_0[27]	)
		);


	assign	pd2_1[26]	=	pd1_4[26];
	assign	pd2_2[26]	=	pd1_3[23];
	full_adder	fa_125(
		.a		(pd1_2[27]	),
		.b		(pd1_1[27]	),
		.ci		(pd1_0[27]	),
		.s		(pd2_3[25]	),
		.co		(pd2_0[28]	)
		);


	assign	pd2_1[27]	=	pd1_4[27];
	assign	pd2_2[27]	=	pd1_3[24];
	full_adder	fa_126(
		.a		(pd1_2[28]	),
		.b		(pd1_1[28]	),
		.ci		(pd1_0[28]	),
		.s		(pd2_3[26]	),
		.co		(pd2_0[29]	)
		);


	assign	pd2_1[28]	=	pd1_3[25];
	assign	pd2_2[28]	=	pd1_2[29];
	half_adder	ha_24(
		.a		(pd1_1[29]	),
		.b		(pd1_0[29]	),
		.s		(pd2_3[27]	),
		.co		(pd2_0[30]	)
		);


	assign	pd2_1[29]	=	pd1_2[30];
	assign	pd2_2[29]	=	pd1_1[30];
	assign	pd2_3[28]	=	pd1_0[30];


	assign	pd2_0[31]	=	pd1_2[31];
	assign	pd2_1[30]	=	pd1_1[31];
	assign	pd2_2[30]	=	pd1_0[31];


	assign	pd2_0[32]	=	pd1_2[32];
	assign	pd2_1[31]	=	pd1_1[32];
	assign	pd2_2[31]	=	pd1_0[32];


	assign	pd2_0[33]	=	pd1_2[33];
	assign	pd2_1[32]	=	pd1_1[33];
	assign	pd2_2[32]	=	pd1_0[33];


	assign	pd2_0[34]	=	pd1_2[34];
	assign	pd2_1[33]	=	pd1_1[34];
	assign	pd2_2[33]	=	pd1_0[34];


	assign	pd2_0[35]	=	pd1_1[35];
	assign	pd2_1[34]	=	pd1_0[35];


	assign	pd2_0[36]	=	pd1_0[36];


	assign	pd2_0[37]	=	pd1_0[37];






















	assign	pd3_0[0]	=	pd2_0[0];


	full_adder	fa_127(
		.a		(pd2_0[1]	),
		.b		(pd2_1[0]	),
		.ci		(pd2_2[0]	),
		.s		(pd3_0[1]	),
		.co		(pd3_0[2]	)
		);


	full_adder	fa_128(
		.a		(pd2_0[2]	),
		.b		(pd2_1[1]	),
		.ci		(pd2_2[1]	),
		.s		(pd3_1[0]	),
		.co		(pd3_0[3]	)
		);
	assign	pd3_2[0]	=	pd2_3[0];


	full_adder	fa_129(
		.a		(pd2_0[3]	),
		.b		(pd2_1[2]	),
		.ci		(pd2_2[2]	),
		.s		(pd3_1[1]	),
		.co		(pd3_0[4]	)
		);
	assign	pd3_2[1]	=	pd2_3[1];


	full_adder	fa_130(
		.a		(pd2_0[4]	),
		.b		(pd2_1[3]	),
		.ci		(pd2_2[3]	),
		.s		(pd3_1[2]	),
		.co		(pd3_0[5]	)
		);
	half_adder	ha_25(
		.a		(pd2_3[2]	),
		.b		(neg[8]	),
		.s		(pd3_2[2]	),
		.co		(pd3_1[3]	)
		);


	full_adder	fa_131(
		.a		(pd2_0[5]	),
		.b		(pd2_1[4]	),
		.ci		(pd2_2[4]	),
		.s		(pd3_2[3]	),
		.co		(pd3_0[6]	)
		);
	assign	pd3_3[0]	=	pd2_3[3];


	full_adder	fa_132(
		.a		(pd2_0[6]	),
		.b		(pd2_1[5]	),
		.ci		(pd2_2[5]	),
		.s		(pd3_1[4]	),
		.co		(pd3_0[7]	)
		);
	half_adder	ha_26(
		.a		(pd2_3[4]	),
		.b		(pd2_4[0]	),
		.s		(pd3_2[4]	),
		.co		(pd3_1[5]	)
		);


	full_adder	fa_133(
		.a		(pd2_0[7]	),
		.b		(pd2_1[6]	),
		.ci		(pd2_2[6]	),
		.s		(pd3_2[5]	),
		.co		(pd3_0[8]	)
		);
	half_adder	ha_27(
		.a		(pd2_3[5]	),
		.b		(pd2_4[1]	),
		.s		(pd3_3[1]	),
		.co		(pd3_1[6]	)
		);


	full_adder	fa_134(
		.a		(pd2_0[8]	),
		.b		(pd2_1[7]	),
		.ci		(pd2_2[7]	),
		.s		(pd3_2[6]	),
		.co		(pd3_0[9]	)
		);
	full_adder	fa_135(
		.a		(pd2_3[6]	),
		.b		(pd2_4[2]	),
		.ci		(pd2_5[0]	),
		.s		(pd3_3[2]	),
		.co		(pd3_1[7]	)
		);


	full_adder	fa_136(
		.a		(pd2_0[9]	),
		.b		(pd2_1[8]	),
		.ci		(pd2_2[8]	),
		.s		(pd3_2[7]	),
		.co		(pd3_0[10]	)
		);
	half_adder	ha_28(
		.a		(pd2_3[7]	),
		.b		(pd2_4[3]	),
		.s		(pd3_3[3]	),
		.co		(pd3_1[8]	)
		);


	full_adder	fa_137(
		.a		(pd2_0[10]	),
		.b		(pd2_1[9]	),
		.ci		(pd2_2[9]	),
		.s		(pd3_2[8]	),
		.co		(pd3_0[11]	)
		);
	full_adder	fa_138(
		.a		(pd2_3[8]	),
		.b		(pd2_4[4]	),
		.ci		(pd2_5[1]	),
		.s		(pd3_3[4]	),
		.co		(pd3_1[9]	)
		);


	full_adder	fa_139(
		.a		(pd2_0[11]	),
		.b		(pd2_1[10]	),
		.ci		(pd2_2[10]	),
		.s		(pd3_2[9]	),
		.co		(pd3_0[12]	)
		);
	full_adder	fa_140(
		.a		(pd2_3[9]	),
		.b		(pd2_4[5]	),
		.ci		(pd2_5[2]	),
		.s		(pd3_3[5]	),
		.co		(pd3_1[10]	)
		);


	full_adder	fa_141(
		.a		(pd2_0[12]	),
		.b		(pd2_1[11]	),
		.ci		(pd2_2[11]	),
		.s		(pd3_2[10]	),
		.co		(pd3_0[13]	)
		);
	full_adder	fa_142(
		.a		(pd2_3[10]	),
		.b		(pd2_4[6]	),
		.ci		(pd2_5[3]	),
		.s		(pd3_3[6]	),
		.co		(pd3_1[11]	)
		);


	full_adder	fa_143(
		.a		(pd2_0[13]	),
		.b		(pd2_1[12]	),
		.ci		(pd2_2[12]	),
		.s		(pd3_2[11]	),
		.co		(pd3_0[14]	)
		);
	full_adder	fa_144(
		.a		(pd2_3[11]	),
		.b		(pd2_4[7]	),
		.ci		(pd2_5[4]	),
		.s		(pd3_3[7]	),
		.co		(pd3_1[12]	)
		);


	full_adder	fa_145(
		.a		(pd2_0[14]	),
		.b		(pd2_1[13]	),
		.ci		(pd2_2[13]	),
		.s		(pd3_2[12]	),
		.co		(pd3_0[15]	)
		);
	full_adder	fa_146(
		.a		(pd2_3[12]	),
		.b		(pd2_4[8]	),
		.ci		(pd2_5[5]	),
		.s		(pd3_3[8]	),
		.co		(pd3_1[13]	)
		);


	full_adder	fa_147(
		.a		(pd2_0[15]	),
		.b		(pd2_1[14]	),
		.ci		(pd2_2[14]	),
		.s		(pd3_2[13]	),
		.co		(pd3_0[16]	)
		);
	full_adder	fa_148(
		.a		(pd2_3[13]	),
		.b		(pd2_4[9]	),
		.ci		(pd2_5[6]	),
		.s		(pd3_3[9]	),
		.co		(pd3_1[14]	)
		);


	full_adder	fa_149(
		.a		(pd2_0[16]	),
		.b		(pd2_1[15]	),
		.ci		(pd2_2[15]	),
		.s		(pd3_2[14]	),
		.co		(pd3_0[17]	)
		);
	full_adder	fa_150(
		.a		(pd2_3[14]	),
		.b		(pd2_4[10]	),
		.ci		(pd2_5[7]	),
		.s		(pd3_3[10]	),
		.co		(pd3_1[15]	)
		);


	full_adder	fa_151(
		.a		(pd2_0[17]	),
		.b		(pd2_1[16]	),
		.ci		(pd2_2[16]	),
		.s		(pd3_2[15]	),
		.co		(pd3_0[18]	)
		);
	full_adder	fa_152(
		.a		(pd2_3[15]	),
		.b		(pd2_4[11]	),
		.ci		(pd2_5[8]	),
		.s		(pd3_3[11]	),
		.co		(pd3_1[16]	)
		);


	full_adder	fa_153(
		.a		(pd2_0[18]	),
		.b		(pd2_1[17]	),
		.ci		(pd2_2[17]	),
		.s		(pd3_2[16]	),
		.co		(pd3_0[19]	)
		);
	full_adder	fa_154(
		.a		(pd2_3[16]	),
		.b		(pd2_4[12]	),
		.ci		(pd2_5[9]	),
		.s		(pd3_3[12]	),
		.co		(pd3_1[17]	)
		);
	assign	pd3_4[0]	=	pd2_6[0];


	assign	pd3_2[17]	=	pd2_5[10];
	assign	pd3_3[13]	=	pd2_4[13];
	full_adder	fa_155(
		.a		(pd2_3[17]	),
		.b		(pd2_2[18]	),
		.ci		(pd2_1[18]	),
		.s		(pd3_4[1]	),
		.co		(pd3_0[20]	)
		);
	assign	pd3_5[0]	=	pd2_0[19];


	assign	pd3_1[18]	=	pd2_5[11];
	assign	pd3_2[18]	=	pd2_4[14];
	full_adder	fa_156(
		.a		(pd2_3[18]	),
		.b		(pd2_2[19]	),
		.ci		(pd2_1[19]	),
		.s		(pd3_3[14]	),
		.co		(pd3_0[21]	)
		);
	assign	pd3_4[2]	=	pd2_0[20];


	assign	pd3_1[19]	=	pd2_5[12];
	assign	pd3_2[19]	=	pd2_4[15];
	full_adder	fa_157(
		.a		(pd2_3[19]	),
		.b		(pd2_2[20]	),
		.ci		(pd2_1[20]	),
		.s		(pd3_3[15]	),
		.co		(pd3_0[22]	)
		);
	assign	pd3_4[3]	=	pd2_0[21];


	assign	pd3_1[20]	=	pd2_5[13];
	assign	pd3_2[20]	=	pd2_4[16];
	full_adder	fa_158(
		.a		(pd2_3[20]	),
		.b		(pd2_2[21]	),
		.ci		(pd2_1[21]	),
		.s		(pd3_3[16]	),
		.co		(pd3_0[23]	)
		);
	assign	pd3_4[4]	=	pd2_0[22];


	assign	pd3_1[21]	=	pd2_5[14];
	assign	pd3_2[21]	=	pd2_4[17];
	full_adder	fa_159(
		.a		(pd2_3[21]	),
		.b		(pd2_2[22]	),
		.ci		(pd2_1[22]	),
		.s		(pd3_3[17]	),
		.co		(pd3_0[24]	)
		);
	assign	pd3_4[5]	=	pd2_0[23];


	assign	pd3_1[22]	=	pd2_3[22];
	assign	pd3_2[22]	=	pd2_2[23];
	half_adder	ha_29(
		.a		(pd2_1[23]	),
		.b		(pd2_0[24]	),
		.s		(pd3_3[18]	),
		.co		(pd3_0[25]	)
		);


	assign	pd3_1[23]	=	pd2_3[23];
	assign	pd3_2[23]	=	pd2_2[24];
	half_adder	ha_30(
		.a		(pd2_1[24]	),
		.b		(pd2_0[25]	),
		.s		(pd3_3[19]	),
		.co		(pd3_0[26]	)
		);


	assign	pd3_1[24]	=	pd2_3[24];
	assign	pd3_2[24]	=	pd2_2[25];
	half_adder	ha_31(
		.a		(pd2_1[25]	),
		.b		(pd2_0[26]	),
		.s		(pd3_3[20]	),
		.co		(pd3_0[27]	)
		);


	assign	pd3_1[25]	=	pd2_3[25];
	assign	pd3_2[25]	=	pd2_2[26];
	half_adder	ha_32(
		.a		(pd2_1[26]	),
		.b		(pd2_0[27]	),
		.s		(pd3_3[21]	),
		.co		(pd3_0[28]	)
		);


	assign	pd3_1[26]	=	pd2_3[26];
	assign	pd3_2[26]	=	pd2_2[27];
	half_adder	ha_33(
		.a		(pd2_1[27]	),
		.b		(pd2_0[28]	),
		.s		(pd3_3[22]	),
		.co		(pd3_0[29]	)
		);


	assign	pd3_1[27]	=	pd2_3[27];
	assign	pd3_2[27]	=	pd2_2[28];
	half_adder	ha_34(
		.a		(pd2_1[28]	),
		.b		(pd2_0[29]	),
		.s		(pd3_3[23]	),
		.co		(pd3_0[30]	)
		);


	assign	pd3_1[28]	=	pd2_3[28];
	assign	pd3_2[28]	=	pd2_2[29];
	half_adder	ha_35(
		.a		(pd2_1[29]	),
		.b		(pd2_0[30]	),
		.s		(pd3_3[24]	),
		.co		(pd3_0[31]	)
		);


	assign	pd3_1[29]	=	pd2_2[30];
	assign	pd3_2[29]	=	pd2_1[30];
	assign	pd3_3[25]	=	pd2_0[31];


	assign	pd3_0[32]	=	pd2_2[31];
	assign	pd3_1[30]	=	pd2_1[31];
	assign	pd3_2[30]	=	pd2_0[32];


	assign	pd3_0[33]	=	pd2_2[32];
	assign	pd3_1[31]	=	pd2_1[32];
	assign	pd3_2[31]	=	pd2_0[33];


	assign	pd3_0[34]	=	pd2_2[33];
	assign	pd3_1[32]	=	pd2_1[33];
	assign	pd3_2[32]	=	pd2_0[34];


	assign	pd3_0[35]	=	pd2_1[34];
	assign	pd3_1[33]	=	pd2_0[35];


	assign	pd3_0[36]	=	pd2_0[36];


	assign	pd3_0[37]	=	pd2_0[37];






















	assign	pd4_0[0]	=	pd3_0[0];


	assign	pd4_0[1]	=	pd3_0[1];


	full_adder	fa_160(
		.a		(pd3_0[2]	),
		.b		(pd3_1[0]	),
		.ci		(pd3_2[0]	),
		.s		(pd4_0[2]	),
		.co		(pd4_0[3]	)
		);


	full_adder	fa_161(
		.a		(pd3_0[3]	),
		.b		(pd3_1[1]	),
		.ci		(pd3_2[1]	),
		.s		(pd4_1[0]	),
		.co		(pd4_0[4]	)
		);


	full_adder	fa_162(
		.a		(pd3_0[4]	),
		.b		(pd3_1[2]	),
		.ci		(pd3_2[2]	),
		.s		(pd4_1[1]	),
		.co		(pd4_0[5]	)
		);


	full_adder	fa_163(
		.a		(pd3_0[5]	),
		.b		(pd3_1[3]	),
		.ci		(pd3_2[3]	),
		.s		(pd4_1[2]	),
		.co		(pd4_0[6]	)
		);
	assign	pd4_2[0]	=	pd3_3[0];


	full_adder	fa_164(
		.a		(pd3_0[6]	),
		.b		(pd3_1[4]	),
		.ci		(pd3_2[4]	),
		.s		(pd4_1[3]	),
		.co		(pd4_0[7]	)
		);


	full_adder	fa_165(
		.a		(pd3_0[7]	),
		.b		(pd3_1[5]	),
		.ci		(pd3_2[5]	),
		.s		(pd4_1[4]	),
		.co		(pd4_0[8]	)
		);
	assign	pd4_2[1]	=	pd3_3[1];


	full_adder	fa_166(
		.a		(pd3_0[8]	),
		.b		(pd3_1[6]	),
		.ci		(pd3_2[6]	),
		.s		(pd4_1[5]	),
		.co		(pd4_0[9]	)
		);
	assign	pd4_2[2]	=	pd3_3[2];


	full_adder	fa_167(
		.a		(pd3_0[9]	),
		.b		(pd3_1[7]	),
		.ci		(pd3_2[7]	),
		.s		(pd4_1[6]	),
		.co		(pd4_0[10]	)
		);
	assign	pd4_2[3]	=	pd3_3[3];


	full_adder	fa_168(
		.a		(pd3_0[10]	),
		.b		(pd3_1[8]	),
		.ci		(pd3_2[8]	),
		.s		(pd4_1[7]	),
		.co		(pd4_0[11]	)
		);
	assign	pd4_2[4]	=	pd3_3[4];


	full_adder	fa_169(
		.a		(pd3_0[11]	),
		.b		(pd3_1[9]	),
		.ci		(pd3_2[9]	),
		.s		(pd4_1[8]	),
		.co		(pd4_0[12]	)
		);
	assign	pd4_2[5]	=	pd3_3[5];


	full_adder	fa_170(
		.a		(pd3_0[12]	),
		.b		(pd3_1[10]	),
		.ci		(pd3_2[10]	),
		.s		(pd4_1[9]	),
		.co		(pd4_0[13]	)
		);
	assign	pd4_2[6]	=	pd3_3[6];


	full_adder	fa_171(
		.a		(pd3_0[13]	),
		.b		(pd3_1[11]	),
		.ci		(pd3_2[11]	),
		.s		(pd4_1[10]	),
		.co		(pd4_0[14]	)
		);
	assign	pd4_2[7]	=	pd3_3[7];


	full_adder	fa_172(
		.a		(pd3_0[14]	),
		.b		(pd3_1[12]	),
		.ci		(pd3_2[12]	),
		.s		(pd4_1[11]	),
		.co		(pd4_0[15]	)
		);
	assign	pd4_2[8]	=	pd3_3[8];


	full_adder	fa_173(
		.a		(pd3_0[15]	),
		.b		(pd3_1[13]	),
		.ci		(pd3_2[13]	),
		.s		(pd4_1[12]	),
		.co		(pd4_0[16]	)
		);
	assign	pd4_2[9]	=	pd3_3[9];


	full_adder	fa_174(
		.a		(pd3_0[16]	),
		.b		(pd3_1[14]	),
		.ci		(pd3_2[14]	),
		.s		(pd4_1[13]	),
		.co		(pd4_0[17]	)
		);
	assign	pd4_2[10]	=	pd3_3[10];


	full_adder	fa_175(
		.a		(pd3_0[17]	),
		.b		(pd3_1[15]	),
		.ci		(pd3_2[15]	),
		.s		(pd4_1[14]	),
		.co		(pd4_0[18]	)
		);
	assign	pd4_2[11]	=	pd3_3[11];


	full_adder	fa_176(
		.a		(pd3_0[18]	),
		.b		(pd3_1[16]	),
		.ci		(pd3_2[16]	),
		.s		(pd4_1[15]	),
		.co		(pd4_0[19]	)
		);
	half_adder	ha_36(
		.a		(pd3_3[12]	),
		.b		(pd3_4[0]	),
		.s		(pd4_2[12]	),
		.co		(pd4_1[16]	)
		);


	full_adder	fa_177(
		.a		(pd3_0[19]	),
		.b		(pd3_1[17]	),
		.ci		(pd3_2[17]	),
		.s		(pd4_2[13]	),
		.co		(pd4_0[20]	)
		);
	full_adder	fa_178(
		.a		(pd3_3[13]	),
		.b		(pd3_4[1]	),
		.ci		(pd3_5[0]	),
		.s		(pd4_3[0]	),
		.co		(pd4_1[17]	)
		);


	full_adder	fa_179(
		.a		(pd3_4[2]	),
		.b		(pd3_3[14]	),
		.ci		(pd3_2[18]	),
		.s		(pd4_2[14]	),
		.co		(pd4_0[21]	)
		);
	half_adder	ha_37(
		.a		(pd3_1[18]	),
		.b		(pd3_0[20]	),
		.s		(pd4_3[1]	),
		.co		(pd4_1[18]	)
		);


	full_adder	fa_180(
		.a		(pd3_4[3]	),
		.b		(pd3_3[15]	),
		.ci		(pd3_2[19]	),
		.s		(pd4_2[15]	),
		.co		(pd4_0[22]	)
		);
	half_adder	ha_38(
		.a		(pd3_1[19]	),
		.b		(pd3_0[21]	),
		.s		(pd4_3[2]	),
		.co		(pd4_1[19]	)
		);


	full_adder	fa_181(
		.a		(pd3_4[4]	),
		.b		(pd3_3[16]	),
		.ci		(pd3_2[20]	),
		.s		(pd4_2[16]	),
		.co		(pd4_0[23]	)
		);
	half_adder	ha_39(
		.a		(pd3_1[20]	),
		.b		(pd3_0[22]	),
		.s		(pd4_3[3]	),
		.co		(pd4_1[20]	)
		);


	full_adder	fa_182(
		.a		(pd3_4[5]	),
		.b		(pd3_3[17]	),
		.ci		(pd3_2[21]	),
		.s		(pd4_2[17]	),
		.co		(pd4_0[24]	)
		);
	half_adder	ha_40(
		.a		(pd3_1[21]	),
		.b		(pd3_0[23]	),
		.s		(pd4_3[4]	),
		.co		(pd4_1[21]	)
		);


	full_adder	fa_183(
		.a		(pd3_3[18]	),
		.b		(pd3_2[22]	),
		.ci		(pd3_1[22]	),
		.s		(pd4_2[18]	),
		.co		(pd4_0[25]	)
		);
	assign	pd4_3[5]	=	pd3_0[24];


	full_adder	fa_184(
		.a		(pd3_3[19]	),
		.b		(pd3_2[23]	),
		.ci		(pd3_1[23]	),
		.s		(pd4_1[22]	),
		.co		(pd4_0[26]	)
		);
	assign	pd4_2[19]	=	pd3_0[25];


	full_adder	fa_185(
		.a		(pd3_3[20]	),
		.b		(pd3_2[24]	),
		.ci		(pd3_1[24]	),
		.s		(pd4_1[23]	),
		.co		(pd4_0[27]	)
		);
	assign	pd4_2[20]	=	pd3_0[26];


	full_adder	fa_186(
		.a		(pd3_3[21]	),
		.b		(pd3_2[25]	),
		.ci		(pd3_1[25]	),
		.s		(pd4_1[24]	),
		.co		(pd4_0[28]	)
		);
	assign	pd4_2[21]	=	pd3_0[27];


	full_adder	fa_187(
		.a		(pd3_3[22]	),
		.b		(pd3_2[26]	),
		.ci		(pd3_1[26]	),
		.s		(pd4_1[25]	),
		.co		(pd4_0[29]	)
		);
	assign	pd4_2[22]	=	pd3_0[28];


	full_adder	fa_188(
		.a		(pd3_3[23]	),
		.b		(pd3_2[27]	),
		.ci		(pd3_1[27]	),
		.s		(pd4_1[26]	),
		.co		(pd4_0[30]	)
		);
	assign	pd4_2[23]	=	pd3_0[29];


	full_adder	fa_189(
		.a		(pd3_3[24]	),
		.b		(pd3_2[28]	),
		.ci		(pd3_1[28]	),
		.s		(pd4_1[27]	),
		.co		(pd4_0[31]	)
		);
	assign	pd4_2[24]	=	pd3_0[30];


	full_adder	fa_190(
		.a		(pd3_3[25]	),
		.b		(pd3_2[29]	),
		.ci		(pd3_1[29]	),
		.s		(pd4_1[28]	),
		.co		(pd4_0[32]	)
		);
	assign	pd4_2[25]	=	pd3_0[31];


	full_adder	fa_191(
		.a		(pd3_2[30]	),
		.b		(pd3_1[30]	),
		.ci		(pd3_0[32]	),
		.s		(pd4_1[29]	),
		.co		(pd4_0[33]	)
		);


	full_adder	fa_192(
		.a		(pd3_2[31]	),
		.b		(pd3_1[31]	),
		.ci		(pd3_0[33]	),
		.s		(pd4_1[30]	),
		.co		(pd4_0[34]	)
		);


	full_adder	fa_193(
		.a		(pd3_2[32]	),
		.b		(pd3_1[32]	),
		.ci		(pd3_0[34]	),
		.s		(pd4_1[31]	),
		.co		(pd4_0[35]	)
		);


	half_adder	ha_41(
		.a		(pd3_1[33]	),
		.b		(pd3_0[35]	),
		.s		(pd4_1[32]	),
		.co		(pd4_0[36]	)
		);


	assign	pd4_1[33]	=	pd3_0[36];


	assign	pd4_0[37]	=	pd3_0[37];






















	assign	pd5_0[0]	=	pd4_0[0];


	assign	pd5_0[1]	=	pd4_0[1];


	assign	pd5_0[2]	=	pd4_0[2];


	half_adder	ha_42(
		.a		(pd4_0[3]	),
		.b		(pd4_1[0]	),
		.s		(pd5_0[3]	),
		.co		(pd5_0[4]	)
		);


	half_adder	ha_43(
		.a		(pd4_0[4]	),
		.b		(pd4_1[1]	),
		.s		(pd5_1[0]	),
		.co		(pd5_0[5]	)
		);


	full_adder	fa_194(
		.a		(pd4_0[5]	),
		.b		(pd4_1[2]	),
		.ci		(pd4_2[0]	),
		.s		(pd5_1[1]	),
		.co		(pd5_0[6]	)
		);


	half_adder	ha_44(
		.a		(pd4_0[6]	),
		.b		(pd4_1[3]	),
		.s		(pd5_1[2]	),
		.co		(pd5_0[7]	)
		);


	full_adder	fa_195(
		.a		(pd4_0[7]	),
		.b		(pd4_1[4]	),
		.ci		(pd4_2[1]	),
		.s		(pd5_1[3]	),
		.co		(pd5_0[8]	)
		);


	full_adder	fa_196(
		.a		(pd4_0[8]	),
		.b		(pd4_1[5]	),
		.ci		(pd4_2[2]	),
		.s		(pd5_1[4]	),
		.co		(pd5_0[9]	)
		);


	full_adder	fa_197(
		.a		(pd4_0[9]	),
		.b		(pd4_1[6]	),
		.ci		(pd4_2[3]	),
		.s		(pd5_1[5]	),
		.co		(pd5_0[10]	)
		);


	full_adder	fa_198(
		.a		(pd4_0[10]	),
		.b		(pd4_1[7]	),
		.ci		(pd4_2[4]	),
		.s		(pd5_1[6]	),
		.co		(pd5_0[11]	)
		);


	full_adder	fa_199(
		.a		(pd4_0[11]	),
		.b		(pd4_1[8]	),
		.ci		(pd4_2[5]	),
		.s		(pd5_1[7]	),
		.co		(pd5_0[12]	)
		);


	full_adder	fa_200(
		.a		(pd4_0[12]	),
		.b		(pd4_1[9]	),
		.ci		(pd4_2[6]	),
		.s		(pd5_1[8]	),
		.co		(pd5_0[13]	)
		);


	full_adder	fa_201(
		.a		(pd4_0[13]	),
		.b		(pd4_1[10]	),
		.ci		(pd4_2[7]	),
		.s		(pd5_1[9]	),
		.co		(pd5_0[14]	)
		);


	full_adder	fa_202(
		.a		(pd4_0[14]	),
		.b		(pd4_1[11]	),
		.ci		(pd4_2[8]	),
		.s		(pd5_1[10]	),
		.co		(pd5_0[15]	)
		);


	full_adder	fa_203(
		.a		(pd4_0[15]	),
		.b		(pd4_1[12]	),
		.ci		(pd4_2[9]	),
		.s		(pd5_1[11]	),
		.co		(pd5_0[16]	)
		);


	full_adder	fa_204(
		.a		(pd4_0[16]	),
		.b		(pd4_1[13]	),
		.ci		(pd4_2[10]	),
		.s		(pd5_1[12]	),
		.co		(pd5_0[17]	)
		);


	full_adder	fa_205(
		.a		(pd4_0[17]	),
		.b		(pd4_1[14]	),
		.ci		(pd4_2[11]	),
		.s		(pd5_1[13]	),
		.co		(pd5_0[18]	)
		);


	full_adder	fa_206(
		.a		(pd4_0[18]	),
		.b		(pd4_1[15]	),
		.ci		(pd4_2[12]	),
		.s		(pd5_1[14]	),
		.co		(pd5_0[19]	)
		);


	full_adder	fa_207(
		.a		(pd4_0[19]	),
		.b		(pd4_1[16]	),
		.ci		(pd4_2[13]	),
		.s		(pd5_1[15]	),
		.co		(pd5_0[20]	)
		);
	assign	pd5_2[0]	=	pd4_3[0];


	full_adder	fa_208(
		.a		(pd4_0[20]	),
		.b		(pd4_1[17]	),
		.ci		(pd4_2[14]	),
		.s		(pd5_1[16]	),
		.co		(pd5_0[21]	)
		);
	assign	pd5_2[1]	=	pd4_3[1];


	full_adder	fa_209(
		.a		(pd4_0[21]	),
		.b		(pd4_1[18]	),
		.ci		(pd4_2[15]	),
		.s		(pd5_1[17]	),
		.co		(pd5_0[22]	)
		);
	assign	pd5_2[2]	=	pd4_3[2];


	full_adder	fa_210(
		.a		(pd4_0[22]	),
		.b		(pd4_1[19]	),
		.ci		(pd4_2[16]	),
		.s		(pd5_1[18]	),
		.co		(pd5_0[23]	)
		);
	assign	pd5_2[3]	=	pd4_3[3];


	full_adder	fa_211(
		.a		(pd4_0[23]	),
		.b		(pd4_1[20]	),
		.ci		(pd4_2[17]	),
		.s		(pd5_1[19]	),
		.co		(pd5_0[24]	)
		);
	assign	pd5_2[4]	=	pd4_3[4];


	full_adder	fa_212(
		.a		(pd4_0[24]	),
		.b		(pd4_1[21]	),
		.ci		(pd4_2[18]	),
		.s		(pd5_1[20]	),
		.co		(pd5_0[25]	)
		);
	assign	pd5_2[5]	=	pd4_3[5];


	assign	pd5_1[21]	=	pd4_2[19];
	half_adder	ha_45(
		.a		(pd4_1[22]	),
		.b		(pd4_0[25]	),
		.s		(pd5_2[6]	),
		.co		(pd5_0[26]	)
		);


	assign	pd5_1[22]	=	pd4_2[20];
	half_adder	ha_46(
		.a		(pd4_1[23]	),
		.b		(pd4_0[26]	),
		.s		(pd5_2[7]	),
		.co		(pd5_0[27]	)
		);


	assign	pd5_1[23]	=	pd4_2[21];
	half_adder	ha_47(
		.a		(pd4_1[24]	),
		.b		(pd4_0[27]	),
		.s		(pd5_2[8]	),
		.co		(pd5_0[28]	)
		);


	assign	pd5_1[24]	=	pd4_2[22];
	half_adder	ha_48(
		.a		(pd4_1[25]	),
		.b		(pd4_0[28]	),
		.s		(pd5_2[9]	),
		.co		(pd5_0[29]	)
		);


	assign	pd5_1[25]	=	pd4_2[23];
	half_adder	ha_49(
		.a		(pd4_1[26]	),
		.b		(pd4_0[29]	),
		.s		(pd5_2[10]	),
		.co		(pd5_0[30]	)
		);


	assign	pd5_1[26]	=	pd4_2[24];
	half_adder	ha_50(
		.a		(pd4_1[27]	),
		.b		(pd4_0[30]	),
		.s		(pd5_2[11]	),
		.co		(pd5_0[31]	)
		);


	assign	pd5_1[27]	=	pd4_2[25];
	half_adder	ha_51(
		.a		(pd4_1[28]	),
		.b		(pd4_0[31]	),
		.s		(pd5_2[12]	),
		.co		(pd5_0[32]	)
		);


	assign	pd5_1[28]	=	pd4_1[29];
	assign	pd5_2[13]	=	pd4_0[32];


	assign	pd5_0[33]	=	pd4_1[30];
	assign	pd5_1[29]	=	pd4_0[33];


	assign	pd5_0[34]	=	pd4_1[31];
	assign	pd5_1[30]	=	pd4_0[34];


	assign	pd5_0[35]	=	pd4_1[32];
	assign	pd5_1[31]	=	pd4_0[35];


	assign	pd5_0[36]	=	pd4_1[33];
	assign	pd5_1[32]	=	pd4_0[36];


	assign	pd5_0[37]	=	pd4_0[37];






















	assign	pd6_0[0]	=	pd5_0[0];


	assign	pd6_0[1]	=	pd5_0[1];


	assign	pd6_0[2]	=	pd5_0[2];


	assign	pd6_0[3]	=	pd5_0[3];


	half_adder	ha_52(
		.a		(pd5_0[4]	),
		.b		(pd5_1[0]	),
		.s		(pd6_0[4]	),
		.co		(pd6_0[5]	)
		);


	half_adder	ha_53(
		.a		(pd5_0[5]	),
		.b		(pd5_1[1]	),
		.s		(pd6_1[0]	),
		.co		(pd6_0[6]	)
		);


	half_adder	ha_54(
		.a		(pd5_0[6]	),
		.b		(pd5_1[2]	),
		.s		(pd6_1[1]	),
		.co		(pd6_0[7]	)
		);


	half_adder	ha_55(
		.a		(pd5_0[7]	),
		.b		(pd5_1[3]	),
		.s		(pd6_1[2]	),
		.co		(pd6_0[8]	)
		);


	half_adder	ha_56(
		.a		(pd5_0[8]	),
		.b		(pd5_1[4]	),
		.s		(pd6_1[3]	),
		.co		(pd6_0[9]	)
		);


	half_adder	ha_57(
		.a		(pd5_0[9]	),
		.b		(pd5_1[5]	),
		.s		(pd6_1[4]	),
		.co		(pd6_0[10]	)
		);


	half_adder	ha_58(
		.a		(pd5_0[10]	),
		.b		(pd5_1[6]	),
		.s		(pd6_1[5]	),
		.co		(pd6_0[11]	)
		);


	half_adder	ha_59(
		.a		(pd5_0[11]	),
		.b		(pd5_1[7]	),
		.s		(pd6_1[6]	),
		.co		(pd6_0[12]	)
		);


	half_adder	ha_60(
		.a		(pd5_0[12]	),
		.b		(pd5_1[8]	),
		.s		(pd6_1[7]	),
		.co		(pd6_0[13]	)
		);


	half_adder	ha_61(
		.a		(pd5_0[13]	),
		.b		(pd5_1[9]	),
		.s		(pd6_1[8]	),
		.co		(pd6_0[14]	)
		);


	half_adder	ha_62(
		.a		(pd5_0[14]	),
		.b		(pd5_1[10]	),
		.s		(pd6_1[9]	),
		.co		(pd6_0[15]	)
		);


	half_adder	ha_63(
		.a		(pd5_0[15]	),
		.b		(pd5_1[11]	),
		.s		(pd6_1[10]	),
		.co		(pd6_0[16]	)
		);


	half_adder	ha_64(
		.a		(pd5_0[16]	),
		.b		(pd5_1[12]	),
		.s		(pd6_1[11]	),
		.co		(pd6_0[17]	)
		);


	half_adder	ha_65(
		.a		(pd5_0[17]	),
		.b		(pd5_1[13]	),
		.s		(pd6_1[12]	),
		.co		(pd6_0[18]	)
		);


	half_adder	ha_66(
		.a		(pd5_0[18]	),
		.b		(pd5_1[14]	),
		.s		(pd6_1[13]	),
		.co		(pd6_0[19]	)
		);


	full_adder	fa_213(
		.a		(pd5_0[19]	),
		.b		(pd5_1[15]	),
		.ci		(pd5_2[0]	),
		.s		(pd6_1[14]	),
		.co		(pd6_0[20]	)
		);


	full_adder	fa_214(
		.a		(pd5_0[20]	),
		.b		(pd5_1[16]	),
		.ci		(pd5_2[1]	),
		.s		(pd6_1[15]	),
		.co		(pd6_0[21]	)
		);


	full_adder	fa_215(
		.a		(pd5_0[21]	),
		.b		(pd5_1[17]	),
		.ci		(pd5_2[2]	),
		.s		(pd6_1[16]	),
		.co		(pd6_0[22]	)
		);


	full_adder	fa_216(
		.a		(pd5_0[22]	),
		.b		(pd5_1[18]	),
		.ci		(pd5_2[3]	),
		.s		(pd6_1[17]	),
		.co		(pd6_0[23]	)
		);


	full_adder	fa_217(
		.a		(pd5_0[23]	),
		.b		(pd5_1[19]	),
		.ci		(pd5_2[4]	),
		.s		(pd6_1[18]	),
		.co		(pd6_0[24]	)
		);


	full_adder	fa_218(
		.a		(pd5_0[24]	),
		.b		(pd5_1[20]	),
		.ci		(pd5_2[5]	),
		.s		(pd6_1[19]	),
		.co		(pd6_0[25]	)
		);


	full_adder	fa_219(
		.a		(pd5_0[25]	),
		.b		(pd5_1[21]	),
		.ci		(pd5_2[6]	),
		.s		(pd6_1[20]	),
		.co		(pd6_0[26]	)
		);


	full_adder	fa_220(
		.a		(pd5_0[26]	),
		.b		(pd5_1[22]	),
		.ci		(pd5_2[7]	),
		.s		(pd6_1[21]	),
		.co		(pd6_0[27]	)
		);


	full_adder	fa_221(
		.a		(pd5_0[27]	),
		.b		(pd5_1[23]	),
		.ci		(pd5_2[8]	),
		.s		(pd6_1[22]	),
		.co		(pd6_0[28]	)
		);


	full_adder	fa_222(
		.a		(pd5_0[28]	),
		.b		(pd5_1[24]	),
		.ci		(pd5_2[9]	),
		.s		(pd6_1[23]	),
		.co		(pd6_0[29]	)
		);


	full_adder	fa_223(
		.a		(pd5_0[29]	),
		.b		(pd5_1[25]	),
		.ci		(pd5_2[10]	),
		.s		(pd6_1[24]	),
		.co		(pd6_0[30]	)
		);


	full_adder	fa_224(
		.a		(pd5_0[30]	),
		.b		(pd5_1[26]	),
		.ci		(pd5_2[11]	),
		.s		(pd6_1[25]	),
		.co		(pd6_0[31]	)
		);


	full_adder	fa_225(
		.a		(pd5_0[31]	),
		.b		(pd5_1[27]	),
		.ci		(pd5_2[12]	),
		.s		(pd6_1[26]	),
		.co		(pd6_0[32]	)
		);


	full_adder	fa_226(
		.a		(pd5_0[32]	),
		.b		(pd5_1[28]	),
		.ci		(pd5_2[13]	),
		.s		(pd6_1[27]	),
		.co		(pd6_0[33]	)
		);


	half_adder	ha_67(
		.a		(pd5_1[29]	),
		.b		(pd5_0[33]	),
		.s		(pd6_1[28]	),
		.co		(pd6_0[34]	)
		);


	half_adder	ha_68(
		.a		(pd5_1[30]	),
		.b		(pd5_0[34]	),
		.s		(pd6_1[29]	),
		.co		(pd6_0[35]	)
		);


	half_adder	ha_69(
		.a		(pd5_1[31]	),
		.b		(pd5_0[35]	),
		.s		(pd6_1[30]	),
		.co		(pd6_0[36]	)
		);


	half_adder	ha_70(
		.a		(pd5_1[32]	),
		.b		(pd5_0[36]	),
		.s		(pd6_1[31]	),
		.co		(pd6_0[37]	)
		);


	assign	pd6_1[32]	=	pd5_0[37];



    
//    assign z = pd6_0 + {pd6_1,5'd0};
    wire [37:0] z1;
    assign z1 = pd6_0 + {pd6_1,5'd0};
    
    assign z = ~z1 + 1'b1;
  
endmodule
