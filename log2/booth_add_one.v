`timescale 1ns / 1ps


module booth_add_one(

    input  [184:0]  pd,      
    input  [7:0]  neg,      
    input  [20:0]  b,
    output [28:0] pd5_0,
    output [23:0] pd5_1

    );
    
    wire [23:0] pd0;
    wire [22:0] pd1;
    wire [22:0] pd2;
    wire [22:0] pd3;
    wire [22:0] pd4;
    wire [22:0] pd5;
    wire [22:0] pd6;
    wire [22:0] pd7;
    
    assign pd0 = pd[23:0];
    assign pd1 = pd[46:24];
    assign pd2 = pd[69:47];
    assign pd3 = pd[92:70];
    assign pd4 = pd[115:93];
    assign pd5 = pd[138:116];
    assign pd6 = pd[161:139];
    assign pd7 = pd[184:162];

    wire [13:0] pd0_0;
    wire [14:0] pd0_1;
    wire [16:0] pd0_2;
    wire [18:0] pd0_3;
    wire [20:0] pd0_4;
    wire [22:0] pd0_5;
    wire [22:0] pd0_6;
    wire [23:0] pd0_7;
    wire [20:0] pd0_9;
    
    assign pd0_0 = pd0[23:10];
    assign pd0_1 = pd1[22:8];
    assign pd0_2 = pd2[22:6];
    assign pd0_3 = pd3[22:4];
    assign pd0_4 = pd4[22:2];
    assign pd0_5 = pd5[22:0];
    assign pd0_6 = pd6[22:0];
    assign pd0_7 = {1'b1,pd7[22:0]};
    assign pd0_9 = b;
    
    
    wire	[27:0]	pd1_0;
	wire	[27:0]	pd1_1;
	wire	[24:0]	pd1_2;
	wire	[19:0]	pd1_3;
	wire	[17:0]	pd1_4;
	wire	[10:0]	pd1_5;
	wire	[0:0]	pd1_6;



	wire	[27:0]	pd2_0;
	wire	[26:0]	pd2_1;
	wire	[25:0]	pd2_2;
	wire	[16:0]	pd2_3;
	wire	[1:0]	pd2_4;



	wire	[27:0]	pd3_0;
	wire	[25:0]	pd3_1;
	wire	[23:0]	pd3_2;
	wire	[6:0]	pd3_3;



	wire	[27:0]	pd4_0;
	wire	[24:0]	pd4_1;
	wire	[13:0]	pd4_2;







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


	full_adder	fa_2(
		.a		(pd0_0[1]	),
		.b		(pd0_1[1]	),
		.ci		(pd0_2[1]	),
		.s		(pd1_2[0]	),
		.co		(pd1_0[2]	)
		);
	full_adder	fa_3(
		.a		(pd0_3[1]	),
		.b		(pd0_4[1]	),
		.ci		(pd0_5[1]	),
		.s		(pd1_3[0]	),
		.co		(pd1_1[2]	)
		);


	full_adder	fa_4(
		.a		(pd0_0[2]	),
		.b		(pd0_1[2]	),
		.ci		(pd0_2[2]	),
		.s		(pd1_2[1]	),
		.co		(pd1_0[3]	)
		);
	full_adder	fa_5(
		.a		(pd0_3[2]	),
		.b		(pd0_4[2]	),
		.ci		(pd0_5[2]	),
		.s		(pd1_3[1]	),
		.co		(pd1_1[3]	)
		);
	half_adder	ha_0(
		.a		(pd0_6[0]	),
		.b		(neg[6]	),
		.s		(pd1_4[0]	),
		.co		(pd1_2[2]	)
		);


	full_adder	fa_6(
		.a		(pd0_0[3]	),
		.b		(pd0_1[3]	),
		.ci		(pd0_2[3]	),
		.s		(pd1_3[2]	),
		.co		(pd1_0[4]	)
		);
	full_adder	fa_7(
		.a		(pd0_3[3]	),
		.b		(pd0_4[3]	),
		.ci		(pd0_5[3]	),
		.s		(pd1_4[1]	),
		.co		(pd1_1[4]	)
		);
	assign	pd1_5[0]	=	pd0_6[1];


	full_adder	fa_8(
		.a		(pd0_0[4]	),
		.b		(pd0_1[4]	),
		.ci		(pd0_2[4]	),
		.s		(pd1_2[3]	),
		.co		(pd1_0[5]	)
		);
	full_adder	fa_9(
		.a		(pd0_3[4]	),
		.b		(pd0_4[4]	),
		.ci		(pd0_5[4]	),
		.s		(pd1_3[3]	),
		.co		(pd1_1[5]	)
		);
	full_adder	fa_10(
		.a		(pd0_6[2]	),
		.b		(pd0_7[0]	),
		.ci		(neg[7]	),
		.s		(pd1_4[2]	),
		.co		(pd1_2[4]	)
		);


	full_adder	fa_11(
		.a		(pd0_0[5]	),
		.b		(pd0_1[5]	),
		.ci		(pd0_2[5]	),
		.s		(pd1_3[4]	),
		.co		(pd1_0[6]	)
		);
	full_adder	fa_12(
		.a		(pd0_3[5]	),
		.b		(pd0_4[5]	),
		.ci		(pd0_5[5]	),
		.s		(pd1_4[3]	),
		.co		(pd1_1[6]	)
		);
	half_adder	ha_1(
		.a		(pd0_6[3]	),
		.b		(pd0_7[1]	),
		.s		(pd1_5[1]	),
		.co		(pd1_2[5]	)
		);


	full_adder	fa_13(
		.a		(pd0_0[6]	),
		.b		(pd0_1[6]	),
		.ci		(pd0_2[6]	),
		.s		(pd1_3[5]	),
		.co		(pd1_0[7]	)
		);
	full_adder	fa_14(
		.a		(pd0_3[6]	),
		.b		(pd0_4[6]	),
		.ci		(pd0_5[6]	),
		.s		(pd1_4[4]	),
		.co		(pd1_1[7]	)
		);
	half_adder	ha_2(
		.a		(pd0_6[4]	),
		.b		(pd0_7[2]	),
		.s		(pd1_5[2]	),
		.co		(pd1_2[6]	)
		);


	full_adder	fa_15(
		.a		(pd0_0[7]	),
		.b		(pd0_1[7]	),
		.ci		(pd0_2[7]	),
		.s		(pd1_3[6]	),
		.co		(pd1_0[8]	)
		);
	full_adder	fa_16(
		.a		(pd0_3[7]	),
		.b		(pd0_4[7]	),
		.ci		(pd0_5[7]	),
		.s		(pd1_4[5]	),
		.co		(pd1_1[8]	)
		);
	full_adder	fa_17(
		.a		(pd0_6[5]	),
		.b		(pd0_7[3]	),
		.ci		(pd0_9[0]	),
		.s		(pd1_5[3]	),
		.co		(pd1_2[7]	)
		);


	full_adder	fa_18(
		.a		(pd0_0[8]	),
		.b		(pd0_1[8]	),
		.ci		(pd0_2[8]	),
		.s		(pd1_3[7]	),
		.co		(pd1_0[9]	)
		);
	full_adder	fa_19(
		.a		(pd0_3[8]	),
		.b		(pd0_4[8]	),
		.ci		(pd0_5[8]	),
		.s		(pd1_4[6]	),
		.co		(pd1_1[9]	)
		);
	full_adder	fa_20(
		.a		(pd0_6[6]	),
		.b		(pd0_7[4]	),
		.ci		(pd0_9[1]	),
		.s		(pd1_5[4]	),
		.co		(pd1_2[8]	)
		);


	full_adder	fa_21(
		.a		(pd0_0[9]	),
		.b		(pd0_1[9]	),
		.ci		(pd0_2[9]	),
		.s		(pd1_3[8]	),
		.co		(pd1_0[10]	)
		);
	full_adder	fa_22(
		.a		(pd0_3[9]	),
		.b		(pd0_4[9]	),
		.ci		(pd0_5[9]	),
		.s		(pd1_4[7]	),
		.co		(pd1_1[10]	)
		);
	full_adder	fa_23(
		.a		(pd0_6[7]	),
		.b		(pd0_7[5]	),
		.ci		(pd0_9[2]	),
		.s		(pd1_5[5]	),
		.co		(pd1_2[9]	)
		);


	full_adder	fa_24(
		.a		(pd0_0[10]	),
		.b		(pd0_1[10]	),
		.ci		(pd0_2[10]	),
		.s		(pd1_3[9]	),
		.co		(pd1_0[11]	)
		);
	full_adder	fa_25(
		.a		(pd0_3[10]	),
		.b		(pd0_4[10]	),
		.ci		(pd0_5[10]	),
		.s		(pd1_4[8]	),
		.co		(pd1_1[11]	)
		);
	full_adder	fa_26(
		.a		(pd0_6[8]	),
		.b		(pd0_7[6]	),
		.ci		(pd0_9[3]	),
		.s		(pd1_5[6]	),
		.co		(pd1_2[10]	)
		);


	full_adder	fa_27(
		.a		(pd0_0[11]	),
		.b		(pd0_1[11]	),
		.ci		(pd0_2[11]	),
		.s		(pd1_3[10]	),
		.co		(pd1_0[12]	)
		);
	full_adder	fa_28(
		.a		(pd0_3[11]	),
		.b		(pd0_4[11]	),
		.ci		(pd0_5[11]	),
		.s		(pd1_4[9]	),
		.co		(pd1_1[12]	)
		);
	full_adder	fa_29(
		.a		(pd0_6[9]	),
		.b		(pd0_7[7]	),
		.ci		(pd0_9[4]	),
		.s		(pd1_5[7]	),
		.co		(pd1_2[11]	)
		);


	full_adder	fa_30(
		.a		(pd0_0[12]	),
		.b		(pd0_1[12]	),
		.ci		(pd0_2[12]	),
		.s		(pd1_3[11]	),
		.co		(pd1_0[13]	)
		);
	full_adder	fa_31(
		.a		(pd0_3[12]	),
		.b		(pd0_4[12]	),
		.ci		(pd0_5[12]	),
		.s		(pd1_4[10]	),
		.co		(pd1_1[13]	)
		);
	full_adder	fa_32(
		.a		(pd0_6[10]	),
		.b		(pd0_7[8]	),
		.ci		(pd0_9[5]	),
		.s		(pd1_5[8]	),
		.co		(pd1_2[12]	)
		);


	full_adder	fa_33(
		.a		(pd0_0[13]	),
		.b		(pd0_1[13]	),
		.ci		(pd0_2[13]	),
		.s		(pd1_3[12]	),
		.co		(pd1_0[14]	)
		);
	full_adder	fa_34(
		.a		(pd0_3[13]	),
		.b		(pd0_4[13]	),
		.ci		(pd0_5[13]	),
		.s		(pd1_4[11]	),
		.co		(pd1_1[14]	)
		);
	full_adder	fa_35(
		.a		(pd0_6[11]	),
		.b		(pd0_7[9]	),
		.ci		(pd0_9[6]	),
		.s		(pd1_5[9]	),
		.co		(pd1_2[13]	)
		);


	assign	pd1_3[13]	=	pd0_9[7];
	full_adder	fa_36(
		.a		(pd0_7[10]	),
		.b		(pd0_6[12]	),
		.ci		(pd0_5[14]	),
		.s		(pd1_4[12]	),
		.co		(pd1_0[15]	)
		);
	full_adder	fa_37(
		.a		(pd0_4[14]	),
		.b		(pd0_3[14]	),
		.ci		(pd0_2[14]	),
		.s		(pd1_5[10]	),
		.co		(pd1_1[15]	)
		);
	assign	pd1_6[0]	=	pd0_1[14];


	assign	pd1_2[14]	=	pd0_9[8];
	full_adder	fa_38(
		.a		(pd0_7[11]	),
		.b		(pd0_6[13]	),
		.ci		(pd0_5[15]	),
		.s		(pd1_3[14]	),
		.co		(pd1_0[16]	)
		);
	full_adder	fa_39(
		.a		(pd0_4[15]	),
		.b		(pd0_3[15]	),
		.ci		(pd0_2[15]	),
		.s		(pd1_4[13]	),
		.co		(pd1_1[16]	)
		);


	assign	pd1_2[15]	=	pd0_9[9];
	full_adder	fa_40(
		.a		(pd0_7[12]	),
		.b		(pd0_6[14]	),
		.ci		(pd0_5[16]	),
		.s		(pd1_3[15]	),
		.co		(pd1_0[17]	)
		);
	full_adder	fa_41(
		.a		(pd0_4[16]	),
		.b		(pd0_3[16]	),
		.ci		(pd0_2[16]	),
		.s		(pd1_4[14]	),
		.co		(pd1_1[17]	)
		);


	assign	pd1_2[16]	=	pd0_9[10];
	full_adder	fa_42(
		.a		(pd0_7[13]	),
		.b		(pd0_6[15]	),
		.ci		(pd0_5[17]	),
		.s		(pd1_3[16]	),
		.co		(pd1_0[18]	)
		);
	half_adder	ha_3(
		.a		(pd0_4[17]	),
		.b		(pd0_3[17]	),
		.s		(pd1_4[15]	),
		.co		(pd1_1[18]	)
		);


	assign	pd1_2[17]	=	pd0_9[11];
	full_adder	fa_43(
		.a		(pd0_7[14]	),
		.b		(pd0_6[16]	),
		.ci		(pd0_5[18]	),
		.s		(pd1_3[17]	),
		.co		(pd1_0[19]	)
		);
	half_adder	ha_4(
		.a		(pd0_4[18]	),
		.b		(pd0_3[18]	),
		.s		(pd1_4[16]	),
		.co		(pd1_1[19]	)
		);


	assign	pd1_2[18]	=	pd0_9[12];
	full_adder	fa_44(
		.a		(pd0_7[15]	),
		.b		(pd0_6[17]	),
		.ci		(pd0_5[19]	),
		.s		(pd1_3[18]	),
		.co		(pd1_0[20]	)
		);
	assign	pd1_4[17]	=	pd0_4[19];


	assign	pd1_1[20]	=	pd0_9[13];
	full_adder	fa_45(
		.a		(pd0_7[16]	),
		.b		(pd0_6[18]	),
		.ci		(pd0_5[20]	),
		.s		(pd1_2[19]	),
		.co		(pd1_0[21]	)
		);
	assign	pd1_3[19]	=	pd0_4[20];


	assign	pd1_1[21]	=	pd0_9[14];
	full_adder	fa_46(
		.a		(pd0_7[17]	),
		.b		(pd0_6[19]	),
		.ci		(pd0_5[21]	),
		.s		(pd1_2[20]	),
		.co		(pd1_0[22]	)
		);


	assign	pd1_1[22]	=	pd0_9[15];
	full_adder	fa_47(
		.a		(pd0_7[18]	),
		.b		(pd0_6[20]	),
		.ci		(pd0_5[22]	),
		.s		(pd1_2[21]	),
		.co		(pd1_0[23]	)
		);


	assign	pd1_1[23]	=	pd0_9[16];
	half_adder	ha_5(
		.a		(pd0_7[19]	),
		.b		(pd0_6[21]	),
		.s		(pd1_2[22]	),
		.co		(pd1_0[24]	)
		);


	assign	pd1_1[24]	=	pd0_9[17];
	half_adder	ha_6(
		.a		(pd0_7[20]	),
		.b		(pd0_6[22]	),
		.s		(pd1_2[23]	),
		.co		(pd1_0[25]	)
		);


	assign	pd1_1[25]	=	pd0_9[18];
	assign	pd1_2[24]	=	pd0_7[21];


	assign	pd1_0[26]	=	pd0_9[19];
	assign	pd1_1[26]	=	pd0_7[22];


	assign	pd1_0[27]	=	pd0_9[20];
	assign	pd1_1[27]	=	pd0_7[23];






















	full_adder	fa_48(
		.a		(pd1_0[0]	),
		.b		(pd1_1[0]	),
		.ci		(neg[5]	),
		.s		(pd2_0[0]	),
		.co		(pd2_0[1]	)
		);


	full_adder	fa_49(
		.a		(pd1_0[1]	),
		.b		(pd1_1[1]	),
		.ci		(pd1_2[0]	),
		.s		(pd2_1[0]	),
		.co		(pd2_0[2]	)
		);
	assign	pd2_2[0]	=	pd1_3[0];


	full_adder	fa_50(
		.a		(pd1_0[2]	),
		.b		(pd1_1[2]	),
		.ci		(pd1_2[1]	),
		.s		(pd2_1[1]	),
		.co		(pd2_0[3]	)
		);
	half_adder	ha_7(
		.a		(pd1_3[1]	),
		.b		(pd1_4[0]	),
		.s		(pd2_2[1]	),
		.co		(pd2_1[2]	)
		);


	full_adder	fa_51(
		.a		(pd1_0[3]	),
		.b		(pd1_1[3]	),
		.ci		(pd1_2[2]	),
		.s		(pd2_2[2]	),
		.co		(pd2_0[4]	)
		);
	full_adder	fa_52(
		.a		(pd1_3[2]	),
		.b		(pd1_4[1]	),
		.ci		(pd1_5[0]	),
		.s		(pd2_3[0]	),
		.co		(pd2_1[3]	)
		);


	full_adder	fa_53(
		.a		(pd1_0[4]	),
		.b		(pd1_1[4]	),
		.ci		(pd1_2[3]	),
		.s		(pd2_2[3]	),
		.co		(pd2_0[5]	)
		);
	half_adder	ha_8(
		.a		(pd1_3[3]	),
		.b		(pd1_4[2]	),
		.s		(pd2_3[1]	),
		.co		(pd2_1[4]	)
		);


	full_adder	fa_54(
		.a		(pd1_0[5]	),
		.b		(pd1_1[5]	),
		.ci		(pd1_2[4]	),
		.s		(pd2_2[4]	),
		.co		(pd2_0[6]	)
		);
	full_adder	fa_55(
		.a		(pd1_3[4]	),
		.b		(pd1_4[3]	),
		.ci		(pd1_5[1]	),
		.s		(pd2_3[2]	),
		.co		(pd2_1[5]	)
		);


	full_adder	fa_56(
		.a		(pd1_0[6]	),
		.b		(pd1_1[6]	),
		.ci		(pd1_2[5]	),
		.s		(pd2_2[5]	),
		.co		(pd2_0[7]	)
		);
	full_adder	fa_57(
		.a		(pd1_3[5]	),
		.b		(pd1_4[4]	),
		.ci		(pd1_5[2]	),
		.s		(pd2_3[3]	),
		.co		(pd2_1[6]	)
		);


	full_adder	fa_58(
		.a		(pd1_0[7]	),
		.b		(pd1_1[7]	),
		.ci		(pd1_2[6]	),
		.s		(pd2_2[6]	),
		.co		(pd2_0[8]	)
		);
	full_adder	fa_59(
		.a		(pd1_3[6]	),
		.b		(pd1_4[5]	),
		.ci		(pd1_5[3]	),
		.s		(pd2_3[4]	),
		.co		(pd2_1[7]	)
		);


	full_adder	fa_60(
		.a		(pd1_0[8]	),
		.b		(pd1_1[8]	),
		.ci		(pd1_2[7]	),
		.s		(pd2_2[7]	),
		.co		(pd2_0[9]	)
		);
	full_adder	fa_61(
		.a		(pd1_3[7]	),
		.b		(pd1_4[6]	),
		.ci		(pd1_5[4]	),
		.s		(pd2_3[5]	),
		.co		(pd2_1[8]	)
		);


	full_adder	fa_62(
		.a		(pd1_0[9]	),
		.b		(pd1_1[9]	),
		.ci		(pd1_2[8]	),
		.s		(pd2_2[8]	),
		.co		(pd2_0[10]	)
		);
	full_adder	fa_63(
		.a		(pd1_3[8]	),
		.b		(pd1_4[7]	),
		.ci		(pd1_5[5]	),
		.s		(pd2_3[6]	),
		.co		(pd2_1[9]	)
		);


	full_adder	fa_64(
		.a		(pd1_0[10]	),
		.b		(pd1_1[10]	),
		.ci		(pd1_2[9]	),
		.s		(pd2_2[9]	),
		.co		(pd2_0[11]	)
		);
	full_adder	fa_65(
		.a		(pd1_3[9]	),
		.b		(pd1_4[8]	),
		.ci		(pd1_5[6]	),
		.s		(pd2_3[7]	),
		.co		(pd2_1[10]	)
		);


	full_adder	fa_66(
		.a		(pd1_0[11]	),
		.b		(pd1_1[11]	),
		.ci		(pd1_2[10]	),
		.s		(pd2_2[10]	),
		.co		(pd2_0[12]	)
		);
	full_adder	fa_67(
		.a		(pd1_3[10]	),
		.b		(pd1_4[9]	),
		.ci		(pd1_5[7]	),
		.s		(pd2_3[8]	),
		.co		(pd2_1[11]	)
		);


	full_adder	fa_68(
		.a		(pd1_0[12]	),
		.b		(pd1_1[12]	),
		.ci		(pd1_2[11]	),
		.s		(pd2_2[11]	),
		.co		(pd2_0[13]	)
		);
	full_adder	fa_69(
		.a		(pd1_3[11]	),
		.b		(pd1_4[10]	),
		.ci		(pd1_5[8]	),
		.s		(pd2_3[9]	),
		.co		(pd2_1[12]	)
		);


	full_adder	fa_70(
		.a		(pd1_0[13]	),
		.b		(pd1_1[13]	),
		.ci		(pd1_2[12]	),
		.s		(pd2_2[12]	),
		.co		(pd2_0[14]	)
		);
	full_adder	fa_71(
		.a		(pd1_3[12]	),
		.b		(pd1_4[11]	),
		.ci		(pd1_5[9]	),
		.s		(pd2_3[10]	),
		.co		(pd2_1[13]	)
		);


	full_adder	fa_72(
		.a		(pd1_0[14]	),
		.b		(pd1_1[14]	),
		.ci		(pd1_2[13]	),
		.s		(pd2_2[13]	),
		.co		(pd2_0[15]	)
		);
	full_adder	fa_73(
		.a		(pd1_3[13]	),
		.b		(pd1_4[12]	),
		.ci		(pd1_5[10]	),
		.s		(pd2_3[11]	),
		.co		(pd2_1[14]	)
		);
	assign	pd2_4[0]	=	pd1_6[0];


	assign	pd2_2[14]	=	pd1_4[13];
	full_adder	fa_74(
		.a		(pd1_3[14]	),
		.b		(pd1_2[14]	),
		.ci		(pd1_1[15]	),
		.s		(pd2_3[12]	),
		.co		(pd2_0[16]	)
		);
	assign	pd2_4[1]	=	pd1_0[15];


	assign	pd2_1[15]	=	pd1_4[14];
	full_adder	fa_75(
		.a		(pd1_3[15]	),
		.b		(pd1_2[15]	),
		.ci		(pd1_1[16]	),
		.s		(pd2_2[15]	),
		.co		(pd2_0[17]	)
		);
	assign	pd2_3[13]	=	pd1_0[16];


	assign	pd2_1[16]	=	pd1_4[15];
	full_adder	fa_76(
		.a		(pd1_3[16]	),
		.b		(pd1_2[16]	),
		.ci		(pd1_1[17]	),
		.s		(pd2_2[16]	),
		.co		(pd2_0[18]	)
		);
	assign	pd2_3[14]	=	pd1_0[17];


	assign	pd2_1[17]	=	pd1_4[16];
	full_adder	fa_77(
		.a		(pd1_3[17]	),
		.b		(pd1_2[17]	),
		.ci		(pd1_1[18]	),
		.s		(pd2_2[17]	),
		.co		(pd2_0[19]	)
		);
	assign	pd2_3[15]	=	pd1_0[18];


	assign	pd2_1[18]	=	pd1_4[17];
	full_adder	fa_78(
		.a		(pd1_3[18]	),
		.b		(pd1_2[18]	),
		.ci		(pd1_1[19]	),
		.s		(pd2_2[18]	),
		.co		(pd2_0[20]	)
		);
	assign	pd2_3[16]	=	pd1_0[19];


	assign	pd2_1[19]	=	pd1_3[19];
	full_adder	fa_79(
		.a		(pd1_2[19]	),
		.b		(pd1_1[20]	),
		.ci		(pd1_0[20]	),
		.s		(pd2_2[19]	),
		.co		(pd2_0[21]	)
		);


	assign	pd2_1[20]	=	pd1_2[20];
	half_adder	ha_9(
		.a		(pd1_1[21]	),
		.b		(pd1_0[21]	),
		.s		(pd2_2[20]	),
		.co		(pd2_0[22]	)
		);


	assign	pd2_1[21]	=	pd1_2[21];
	half_adder	ha_10(
		.a		(pd1_1[22]	),
		.b		(pd1_0[22]	),
		.s		(pd2_2[21]	),
		.co		(pd2_0[23]	)
		);


	assign	pd2_1[22]	=	pd1_2[22];
	half_adder	ha_11(
		.a		(pd1_1[23]	),
		.b		(pd1_0[23]	),
		.s		(pd2_2[22]	),
		.co		(pd2_0[24]	)
		);


	assign	pd2_1[23]	=	pd1_2[23];
	half_adder	ha_12(
		.a		(pd1_1[24]	),
		.b		(pd1_0[24]	),
		.s		(pd2_2[23]	),
		.co		(pd2_0[25]	)
		);


	assign	pd2_1[24]	=	pd1_2[24];
	half_adder	ha_13(
		.a		(pd1_1[25]	),
		.b		(pd1_0[25]	),
		.s		(pd2_2[24]	),
		.co		(pd2_0[26]	)
		);


	assign	pd2_1[25]	=	pd1_1[26];
	assign	pd2_2[25]	=	pd1_0[26];


	assign	pd2_0[27]	=	pd1_1[27];
	assign	pd2_1[26]	=	pd1_0[27];






















	assign	pd3_0[0]	=	pd2_0[0];


	full_adder	fa_80(
		.a		(pd2_0[1]	),
		.b		(pd2_1[0]	),
		.ci		(pd2_2[0]	),
		.s		(pd3_0[1]	),
		.co		(pd3_0[2]	)
		);


	full_adder	fa_81(
		.a		(pd2_0[2]	),
		.b		(pd2_1[1]	),
		.ci		(pd2_2[1]	),
		.s		(pd3_1[0]	),
		.co		(pd3_0[3]	)
		);


	full_adder	fa_82(
		.a		(pd2_0[3]	),
		.b		(pd2_1[2]	),
		.ci		(pd2_2[2]	),
		.s		(pd3_1[1]	),
		.co		(pd3_0[4]	)
		);
	assign	pd3_2[0]	=	pd2_3[0];


	full_adder	fa_83(
		.a		(pd2_0[4]	),
		.b		(pd2_1[3]	),
		.ci		(pd2_2[3]	),
		.s		(pd3_1[2]	),
		.co		(pd3_0[5]	)
		);
	assign	pd3_2[1]	=	pd2_3[1];


	full_adder	fa_84(
		.a		(pd2_0[5]	),
		.b		(pd2_1[4]	),
		.ci		(pd2_2[4]	),
		.s		(pd3_1[3]	),
		.co		(pd3_0[6]	)
		);
	assign	pd3_2[2]	=	pd2_3[2];


	full_adder	fa_85(
		.a		(pd2_0[6]	),
		.b		(pd2_1[5]	),
		.ci		(pd2_2[5]	),
		.s		(pd3_1[4]	),
		.co		(pd3_0[7]	)
		);
	assign	pd3_2[3]	=	pd2_3[3];


	full_adder	fa_86(
		.a		(pd2_0[7]	),
		.b		(pd2_1[6]	),
		.ci		(pd2_2[6]	),
		.s		(pd3_1[5]	),
		.co		(pd3_0[8]	)
		);
	assign	pd3_2[4]	=	pd2_3[4];


	full_adder	fa_87(
		.a		(pd2_0[8]	),
		.b		(pd2_1[7]	),
		.ci		(pd2_2[7]	),
		.s		(pd3_1[6]	),
		.co		(pd3_0[9]	)
		);
	assign	pd3_2[5]	=	pd2_3[5];


	full_adder	fa_88(
		.a		(pd2_0[9]	),
		.b		(pd2_1[8]	),
		.ci		(pd2_2[8]	),
		.s		(pd3_1[7]	),
		.co		(pd3_0[10]	)
		);
	assign	pd3_2[6]	=	pd2_3[6];


	full_adder	fa_89(
		.a		(pd2_0[10]	),
		.b		(pd2_1[9]	),
		.ci		(pd2_2[9]	),
		.s		(pd3_1[8]	),
		.co		(pd3_0[11]	)
		);
	assign	pd3_2[7]	=	pd2_3[7];


	full_adder	fa_90(
		.a		(pd2_0[11]	),
		.b		(pd2_1[10]	),
		.ci		(pd2_2[10]	),
		.s		(pd3_1[9]	),
		.co		(pd3_0[12]	)
		);
	assign	pd3_2[8]	=	pd2_3[8];


	full_adder	fa_91(
		.a		(pd2_0[12]	),
		.b		(pd2_1[11]	),
		.ci		(pd2_2[11]	),
		.s		(pd3_1[10]	),
		.co		(pd3_0[13]	)
		);
	assign	pd3_2[9]	=	pd2_3[9];


	full_adder	fa_92(
		.a		(pd2_0[13]	),
		.b		(pd2_1[12]	),
		.ci		(pd2_2[12]	),
		.s		(pd3_1[11]	),
		.co		(pd3_0[14]	)
		);
	assign	pd3_2[10]	=	pd2_3[10];


	full_adder	fa_93(
		.a		(pd2_0[14]	),
		.b		(pd2_1[13]	),
		.ci		(pd2_2[13]	),
		.s		(pd3_1[12]	),
		.co		(pd3_0[15]	)
		);
	assign	pd3_2[11]	=	pd2_3[11];
	assign	pd3_3[0]	=	pd2_4[0];


	full_adder	fa_94(
		.a		(pd2_0[15]	),
		.b		(pd2_1[14]	),
		.ci		(pd2_2[14]	),
		.s		(pd3_1[13]	),
		.co		(pd3_0[16]	)
		);
	assign	pd3_2[12]	=	pd2_3[12];
	assign	pd3_3[1]	=	pd2_4[1];


	assign	pd3_1[14]	=	pd2_3[13];
	assign	pd3_2[13]	=	pd2_2[15];
	half_adder	ha_14(
		.a		(pd2_1[15]	),
		.b		(pd2_0[16]	),
		.s		(pd3_3[2]	),
		.co		(pd3_0[17]	)
		);


	assign	pd3_1[15]	=	pd2_3[14];
	assign	pd3_2[14]	=	pd2_2[16];
	half_adder	ha_15(
		.a		(pd2_1[16]	),
		.b		(pd2_0[17]	),
		.s		(pd3_3[3]	),
		.co		(pd3_0[18]	)
		);


	assign	pd3_1[16]	=	pd2_3[15];
	assign	pd3_2[15]	=	pd2_2[17];
	half_adder	ha_16(
		.a		(pd2_1[17]	),
		.b		(pd2_0[18]	),
		.s		(pd3_3[4]	),
		.co		(pd3_0[19]	)
		);


	assign	pd3_1[17]	=	pd2_3[16];
	assign	pd3_2[16]	=	pd2_2[18];
	half_adder	ha_17(
		.a		(pd2_1[18]	),
		.b		(pd2_0[19]	),
		.s		(pd3_3[5]	),
		.co		(pd3_0[20]	)
		);


	assign	pd3_1[18]	=	pd2_2[19];
	assign	pd3_2[17]	=	pd2_1[19];
	assign	pd3_3[6]	=	pd2_0[20];


	assign	pd3_0[21]	=	pd2_2[20];
	assign	pd3_1[19]	=	pd2_1[20];
	assign	pd3_2[18]	=	pd2_0[21];


	assign	pd3_0[22]	=	pd2_2[21];
	assign	pd3_1[20]	=	pd2_1[21];
	assign	pd3_2[19]	=	pd2_0[22];


	assign	pd3_0[23]	=	pd2_2[22];
	assign	pd3_1[21]	=	pd2_1[22];
	assign	pd3_2[20]	=	pd2_0[23];


	assign	pd3_0[24]	=	pd2_2[23];
	assign	pd3_1[22]	=	pd2_1[23];
	assign	pd3_2[21]	=	pd2_0[24];


	assign	pd3_0[25]	=	pd2_2[24];
	assign	pd3_1[23]	=	pd2_1[24];
	assign	pd3_2[22]	=	pd2_0[25];


	assign	pd3_0[26]	=	pd2_2[25];
	assign	pd3_1[24]	=	pd2_1[25];
	assign	pd3_2[23]	=	pd2_0[26];


	assign	pd3_0[27]	=	pd2_1[26];
	assign	pd3_1[25]	=	pd2_0[27];






















	assign	pd4_0[0]	=	pd3_0[0];


	assign	pd4_0[1]	=	pd3_0[1];


	half_adder	ha_18(
		.a		(pd3_0[2]	),
		.b		(pd3_1[0]	),
		.s		(pd4_0[2]	),
		.co		(pd4_0[3]	)
		);


	full_adder	fa_95(
		.a		(pd3_0[3]	),
		.b		(pd3_1[1]	),
		.ci		(pd3_2[0]	),
		.s		(pd4_1[0]	),
		.co		(pd4_0[4]	)
		);


	full_adder	fa_96(
		.a		(pd3_0[4]	),
		.b		(pd3_1[2]	),
		.ci		(pd3_2[1]	),
		.s		(pd4_1[1]	),
		.co		(pd4_0[5]	)
		);


	full_adder	fa_97(
		.a		(pd3_0[5]	),
		.b		(pd3_1[3]	),
		.ci		(pd3_2[2]	),
		.s		(pd4_1[2]	),
		.co		(pd4_0[6]	)
		);


	full_adder	fa_98(
		.a		(pd3_0[6]	),
		.b		(pd3_1[4]	),
		.ci		(pd3_2[3]	),
		.s		(pd4_1[3]	),
		.co		(pd4_0[7]	)
		);


	full_adder	fa_99(
		.a		(pd3_0[7]	),
		.b		(pd3_1[5]	),
		.ci		(pd3_2[4]	),
		.s		(pd4_1[4]	),
		.co		(pd4_0[8]	)
		);


	full_adder	fa_100(
		.a		(pd3_0[8]	),
		.b		(pd3_1[6]	),
		.ci		(pd3_2[5]	),
		.s		(pd4_1[5]	),
		.co		(pd4_0[9]	)
		);


	full_adder	fa_101(
		.a		(pd3_0[9]	),
		.b		(pd3_1[7]	),
		.ci		(pd3_2[6]	),
		.s		(pd4_1[6]	),
		.co		(pd4_0[10]	)
		);


	full_adder	fa_102(
		.a		(pd3_0[10]	),
		.b		(pd3_1[8]	),
		.ci		(pd3_2[7]	),
		.s		(pd4_1[7]	),
		.co		(pd4_0[11]	)
		);


	full_adder	fa_103(
		.a		(pd3_0[11]	),
		.b		(pd3_1[9]	),
		.ci		(pd3_2[8]	),
		.s		(pd4_1[8]	),
		.co		(pd4_0[12]	)
		);


	full_adder	fa_104(
		.a		(pd3_0[12]	),
		.b		(pd3_1[10]	),
		.ci		(pd3_2[9]	),
		.s		(pd4_1[9]	),
		.co		(pd4_0[13]	)
		);


	full_adder	fa_105(
		.a		(pd3_0[13]	),
		.b		(pd3_1[11]	),
		.ci		(pd3_2[10]	),
		.s		(pd4_1[10]	),
		.co		(pd4_0[14]	)
		);


	full_adder	fa_106(
		.a		(pd3_0[14]	),
		.b		(pd3_1[12]	),
		.ci		(pd3_2[11]	),
		.s		(pd4_1[11]	),
		.co		(pd4_0[15]	)
		);
	assign	pd4_2[0]	=	pd3_3[0];


	full_adder	fa_107(
		.a		(pd3_0[15]	),
		.b		(pd3_1[13]	),
		.ci		(pd3_2[12]	),
		.s		(pd4_1[12]	),
		.co		(pd4_0[16]	)
		);
	assign	pd4_2[1]	=	pd3_3[1];


	full_adder	fa_108(
		.a		(pd3_0[16]	),
		.b		(pd3_1[14]	),
		.ci		(pd3_2[13]	),
		.s		(pd4_1[13]	),
		.co		(pd4_0[17]	)
		);
	assign	pd4_2[2]	=	pd3_3[2];


	full_adder	fa_109(
		.a		(pd3_0[17]	),
		.b		(pd3_1[15]	),
		.ci		(pd3_2[14]	),
		.s		(pd4_1[14]	),
		.co		(pd4_0[18]	)
		);
	assign	pd4_2[3]	=	pd3_3[3];


	full_adder	fa_110(
		.a		(pd3_0[18]	),
		.b		(pd3_1[16]	),
		.ci		(pd3_2[15]	),
		.s		(pd4_1[15]	),
		.co		(pd4_0[19]	)
		);
	assign	pd4_2[4]	=	pd3_3[4];


	full_adder	fa_111(
		.a		(pd3_0[19]	),
		.b		(pd3_1[17]	),
		.ci		(pd3_2[16]	),
		.s		(pd4_1[16]	),
		.co		(pd4_0[20]	)
		);
	assign	pd4_2[5]	=	pd3_3[5];


	full_adder	fa_112(
		.a		(pd3_0[20]	),
		.b		(pd3_1[18]	),
		.ci		(pd3_2[17]	),
		.s		(pd4_1[17]	),
		.co		(pd4_0[21]	)
		);
	assign	pd4_2[6]	=	pd3_3[6];


	assign	pd4_1[18]	=	pd3_2[18];
	half_adder	ha_19(
		.a		(pd3_1[19]	),
		.b		(pd3_0[21]	),
		.s		(pd4_2[7]	),
		.co		(pd4_0[22]	)
		);


	assign	pd4_1[19]	=	pd3_2[19];
	half_adder	ha_20(
		.a		(pd3_1[20]	),
		.b		(pd3_0[22]	),
		.s		(pd4_2[8]	),
		.co		(pd4_0[23]	)
		);


	assign	pd4_1[20]	=	pd3_2[20];
	half_adder	ha_21(
		.a		(pd3_1[21]	),
		.b		(pd3_0[23]	),
		.s		(pd4_2[9]	),
		.co		(pd4_0[24]	)
		);


	assign	pd4_1[21]	=	pd3_2[21];
	half_adder	ha_22(
		.a		(pd3_1[22]	),
		.b		(pd3_0[24]	),
		.s		(pd4_2[10]	),
		.co		(pd4_0[25]	)
		);


	assign	pd4_1[22]	=	pd3_2[22];
	half_adder	ha_23(
		.a		(pd3_1[23]	),
		.b		(pd3_0[25]	),
		.s		(pd4_2[11]	),
		.co		(pd4_0[26]	)
		);


	assign	pd4_1[23]	=	pd3_2[23];
	half_adder	ha_24(
		.a		(pd3_1[24]	),
		.b		(pd3_0[26]	),
		.s		(pd4_2[12]	),
		.co		(pd4_0[27]	)
		);


	assign	pd4_1[24]	=	pd3_1[25];
	assign	pd4_2[13]	=	pd3_0[27];






















	assign	pd5_0[0]	=	pd4_0[0];


	assign	pd5_0[1]	=	pd4_0[1];


	assign	pd5_0[2]	=	pd4_0[2];


	half_adder	ha_25(
		.a		(pd4_0[3]	),
		.b		(pd4_1[0]	),
		.s		(pd5_0[3]	),
		.co		(pd5_0[4]	)
		);


	half_adder	ha_26(
		.a		(pd4_0[4]	),
		.b		(pd4_1[1]	),
		.s		(pd5_1[0]	),
		.co		(pd5_0[5]	)
		);


	half_adder	ha_27(
		.a		(pd4_0[5]	),
		.b		(pd4_1[2]	),
		.s		(pd5_1[1]	),
		.co		(pd5_0[6]	)
		);


	half_adder	ha_28(
		.a		(pd4_0[6]	),
		.b		(pd4_1[3]	),
		.s		(pd5_1[2]	),
		.co		(pd5_0[7]	)
		);


	half_adder	ha_29(
		.a		(pd4_0[7]	),
		.b		(pd4_1[4]	),
		.s		(pd5_1[3]	),
		.co		(pd5_0[8]	)
		);


	half_adder	ha_30(
		.a		(pd4_0[8]	),
		.b		(pd4_1[5]	),
		.s		(pd5_1[4]	),
		.co		(pd5_0[9]	)
		);


	half_adder	ha_31(
		.a		(pd4_0[9]	),
		.b		(pd4_1[6]	),
		.s		(pd5_1[5]	),
		.co		(pd5_0[10]	)
		);


	half_adder	ha_32(
		.a		(pd4_0[10]	),
		.b		(pd4_1[7]	),
		.s		(pd5_1[6]	),
		.co		(pd5_0[11]	)
		);


	half_adder	ha_33(
		.a		(pd4_0[11]	),
		.b		(pd4_1[8]	),
		.s		(pd5_1[7]	),
		.co		(pd5_0[12]	)
		);


	half_adder	ha_34(
		.a		(pd4_0[12]	),
		.b		(pd4_1[9]	),
		.s		(pd5_1[8]	),
		.co		(pd5_0[13]	)
		);


	half_adder	ha_35(
		.a		(pd4_0[13]	),
		.b		(pd4_1[10]	),
		.s		(pd5_1[9]	),
		.co		(pd5_0[14]	)
		);


	full_adder	fa_113(
		.a		(pd4_0[14]	),
		.b		(pd4_1[11]	),
		.ci		(pd4_2[0]	),
		.s		(pd5_1[10]	),
		.co		(pd5_0[15]	)
		);


	full_adder	fa_114(
		.a		(pd4_0[15]	),
		.b		(pd4_1[12]	),
		.ci		(pd4_2[1]	),
		.s		(pd5_1[11]	),
		.co		(pd5_0[16]	)
		);


	full_adder	fa_115(
		.a		(pd4_0[16]	),
		.b		(pd4_1[13]	),
		.ci		(pd4_2[2]	),
		.s		(pd5_1[12]	),
		.co		(pd5_0[17]	)
		);


	full_adder	fa_116(
		.a		(pd4_0[17]	),
		.b		(pd4_1[14]	),
		.ci		(pd4_2[3]	),
		.s		(pd5_1[13]	),
		.co		(pd5_0[18]	)
		);


	full_adder	fa_117(
		.a		(pd4_0[18]	),
		.b		(pd4_1[15]	),
		.ci		(pd4_2[4]	),
		.s		(pd5_1[14]	),
		.co		(pd5_0[19]	)
		);


	full_adder	fa_118(
		.a		(pd4_0[19]	),
		.b		(pd4_1[16]	),
		.ci		(pd4_2[5]	),
		.s		(pd5_1[15]	),
		.co		(pd5_0[20]	)
		);


	full_adder	fa_119(
		.a		(pd4_0[20]	),
		.b		(pd4_1[17]	),
		.ci		(pd4_2[6]	),
		.s		(pd5_1[16]	),
		.co		(pd5_0[21]	)
		);


	full_adder	fa_120(
		.a		(pd4_0[21]	),
		.b		(pd4_1[18]	),
		.ci		(pd4_2[7]	),
		.s		(pd5_1[17]	),
		.co		(pd5_0[22]	)
		);


	full_adder	fa_121(
		.a		(pd4_0[22]	),
		.b		(pd4_1[19]	),
		.ci		(pd4_2[8]	),
		.s		(pd5_1[18]	),
		.co		(pd5_0[23]	)
		);


	full_adder	fa_122(
		.a		(pd4_0[23]	),
		.b		(pd4_1[20]	),
		.ci		(pd4_2[9]	),
		.s		(pd5_1[19]	),
		.co		(pd5_0[24]	)
		);


	full_adder	fa_123(
		.a		(pd4_0[24]	),
		.b		(pd4_1[21]	),
		.ci		(pd4_2[10]	),
		.s		(pd5_1[20]	),
		.co		(pd5_0[25]	)
		);


	full_adder	fa_124(
		.a		(pd4_0[25]	),
		.b		(pd4_1[22]	),
		.ci		(pd4_2[11]	),
		.s		(pd5_1[21]	),
		.co		(pd5_0[26]	)
		);


	full_adder	fa_125(
		.a		(pd4_0[26]	),
		.b		(pd4_1[23]	),
		.ci		(pd4_2[12]	),
		.s		(pd5_1[22]	),
		.co		(pd5_0[27]	)
		);


	full_adder	fa_126(
		.a		(pd4_0[27]	),
		.b		(pd4_1[24]	),
		.ci		(pd4_2[13]	),
		.s		(pd5_1[23]	),
		.co		(pd5_0[28]	)
		);













   
endmodule
