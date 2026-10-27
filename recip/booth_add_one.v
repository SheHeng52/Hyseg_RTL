`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/07/12 13:41:50
// Design Name: 
// Module Name: booth_add_one
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


module booth_add_one(

    input  [230:0]  pd,      
    input  [9:0]  neg,      
    input  [17:0]  b,
    output [30:0] pd5_0,
    output [28:0] pd5_1
    
    );
    
    wire [23:0] pd0;
    wire [22:0] pd1;
    wire [22:0] pd2;
    wire [22:0] pd3;
    wire [22:0] pd4;
    wire [22:0] pd5;
    wire [22:0] pd6;
    wire [22:0] pd7;
    wire [22:0] pd8;
    wire [22:0] pd9;
   
    
    assign pd0 = pd[23:0];
    assign pd1 = pd[46:24];
    assign pd2 = pd[69:47];
    assign pd3 = pd[92:70];
    assign pd4 = pd[115:93];
    assign pd5 = pd[138:116];
    assign pd6 = pd[161:139];
    assign pd7 = pd[184:162];
    assign pd8 = pd[207:185];
    assign pd9 = pd[230:208];


    wire [12:0] pd0_0;
    wire [13:0] pd0_1;
    wire [15:0] pd0_2;
    wire [17:0] pd0_3;
    wire [19:0] pd0_4;
    wire [21:0] pd0_5;
    wire [22:0] pd0_6;
    wire [22:0] pd0_7;
    wire [22:0] pd0_8;
    wire [25:0] pd0_9;
    
    wire [18:0] pd0_11;
    
    assign pd0_0 = pd0[23:11];
    assign pd0_1 = pd1[22:9];
    assign pd0_2 = pd2[22:7];
    assign pd0_3 = pd3[22:5];
    assign pd0_4 = pd4[22:3];
    assign pd0_5 = pd5[22:1];
    assign pd0_6 = pd6[22:0];
    assign pd0_7 = pd7[22:0];
    assign pd0_8 = pd8[22:0];
    assign pd0_9 = {3'b111,pd9[22:0]}; 
    
    assign pd0_11 = {1'b1,b};
    
    
    wire	[31:0]	pd1_0;
	wire	[31:0]	pd1_1;
	wire	[24:0]	pd1_2;
	wire	[23:0]	pd1_3;
	wire	[18:0]	pd1_4;
	wire	[15:0]	pd1_5;
	wire	[5:0]	pd1_6;
	wire	[0:0]	pd1_7;



	wire	[30:0]	pd2_0;
	wire	[30:0]	pd2_1;
	wire	[23:0]	pd2_2;
	wire	[23:0]	pd2_3;
	wire	[11:0]	pd2_4;
	wire	[5:0]	pd2_5;



	wire	[30:0]	pd3_0;
	wire	[30:0]	pd3_1;
	wire	[22:0]	pd3_2;
	wire	[12:0]	pd3_3;



	wire	[30:0]	pd4_0;
	wire	[29:0]	pd4_1;
	wire	[19:0]	pd4_2;




	full_adder	fa_0(
		.a		(pd0_0[0]	),
		.b		(pd0_1[0]	),
		.ci		(pd0_2[0]	),
		.s		(),
		.co		(pd1_0[0]	)
		);
	full_adder	fa_1(
		.a		(pd0_3[0]	),
		.b		(pd0_4[0]	),
		.ci		(pd0_5[0]	),
		.s		(),
		.co		(pd1_1[0]	)
		);


	full_adder	fa_2(
		.a		(pd0_0[1]	),
		.b		(pd0_1[1]	),
		.ci		(pd0_2[1]	),
		.s		(pd1_2[0]	),
		.co		(pd1_0[1]	)
		);
	full_adder	fa_3(
		.a		(pd0_3[1]	),
		.b		(pd0_4[1]	),
		.ci		(pd0_5[1]	),
		.s		(pd1_3[0]	),
		.co		(pd1_1[1]	)
		);
	half_adder	ha_0(
		.a		(pd0_6[0]	),
		.b		(neg[6]	),
		.s		(pd1_4[0]	),
		.co		(pd1_2[1]	)
		);


	full_adder	fa_4(
		.a		(pd0_0[2]	),
		.b		(pd0_1[2]	),
		.ci		(pd0_2[2]	),
		.s		(pd1_3[1]	),
		.co		(pd1_0[2]	)
		);
	full_adder	fa_5(
		.a		(pd0_3[2]	),
		.b		(pd0_4[2]	),
		.ci		(pd0_5[2]	),
		.s		(pd1_4[1]	),
		.co		(pd1_1[2]	)
		);
	assign	pd1_5[0]	=	pd0_6[1];


	full_adder	fa_6(
		.a		(pd0_0[3]	),
		.b		(pd0_1[3]	),
		.ci		(pd0_2[3]	),
		.s		(pd1_2[2]	),
		.co		(pd1_0[3]	)
		);
	full_adder	fa_7(
		.a		(pd0_3[3]	),
		.b		(pd0_4[3]	),
		.ci		(pd0_5[3]	),
		.s		(pd1_3[2]	),
		.co		(pd1_1[3]	)
		);
	full_adder	fa_8(
		.a		(pd0_6[2]	),
		.b		(pd0_7[0]	),
		.ci		(neg[7]	),
		.s		(pd1_4[2]	),
		.co		(pd1_2[3]	)
		);


	full_adder	fa_9(
		.a		(pd0_0[4]	),
		.b		(pd0_1[4]	),
		.ci		(pd0_2[4]	),
		.s		(pd1_3[3]	),
		.co		(pd1_0[4]	)
		);
	full_adder	fa_10(
		.a		(pd0_3[4]	),
		.b		(pd0_4[4]	),
		.ci		(pd0_5[4]	),
		.s		(pd1_4[3]	),
		.co		(pd1_1[4]	)
		);
	half_adder	ha_1(
		.a		(pd0_6[3]	),
		.b		(pd0_7[1]	),
		.s		(pd1_5[1]	),
		.co		(pd1_2[4]	)
		);


	full_adder	fa_11(
		.a		(pd0_0[5]	),
		.b		(pd0_1[5]	),
		.ci		(pd0_2[5]	),
		.s		(pd1_3[4]	),
		.co		(pd1_0[5]	)
		);
	full_adder	fa_12(
		.a		(pd0_3[5]	),
		.b		(pd0_4[5]	),
		.ci		(pd0_5[5]	),
		.s		(pd1_4[4]	),
		.co		(pd1_1[5]	)
		);
	full_adder	fa_13(
		.a		(pd0_6[4]	),
		.b		(pd0_7[2]	),
		.ci		(pd0_8[0]	),
		.s		(pd1_5[2]	),
		.co		(pd1_2[5]	)
		);


	full_adder	fa_14(
		.a		(pd0_0[6]	),
		.b		(pd0_1[6]	),
		.ci		(pd0_2[6]	),
		.s		(pd1_3[5]	),
		.co		(pd1_0[6]	)
		);
	full_adder	fa_15(
		.a		(pd0_3[6]	),
		.b		(pd0_4[6]	),
		.ci		(pd0_5[6]	),
		.s		(pd1_4[5]	),
		.co		(pd1_1[6]	)
		);
	full_adder	fa_16(
		.a		(pd0_6[5]	),
		.b		(pd0_7[3]	),
		.ci		(pd0_8[1]	),
		.s		(pd1_5[3]	),
		.co		(pd1_2[6]	)
		);


	full_adder	fa_17(
		.a		(pd0_0[7]	),
		.b		(pd0_1[7]	),
		.ci		(pd0_2[7]	),
		.s		(pd1_3[6]	),
		.co		(pd1_0[7]	)
		);
	full_adder	fa_18(
		.a		(pd0_3[7]	),
		.b		(pd0_4[7]	),
		.ci		(pd0_5[7]	),
		.s		(pd1_4[6]	),
		.co		(pd1_1[7]	)
		);
	full_adder	fa_19(
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
		.co		(pd1_3[7]	)
		);


	full_adder	fa_20(
		.a		(pd0_9[1]	),
		.b		(pd0_8[3]	),
		.ci		(pd0_7[5]	),
		.s		(pd1_4[7]	),
		.co		(pd1_0[8]	)
		);
	full_adder	fa_21(
		.a		(pd0_6[7]	),
		.b		(pd0_5[8]	),
		.ci		(pd0_4[8]	),
		.s		(pd1_5[5]	),
		.co		(pd1_1[8]	)
		);
	full_adder	fa_22(
		.a		(pd0_3[8]	),
		.b		(pd0_2[8]	),
		.ci		(pd0_1[8]	),
		.s		(pd1_6[1]	),
		.co		(pd1_2[8]	)
		);
	assign	pd1_7[0]	=	pd0_0[8];


	full_adder	fa_23(
		.a		(pd0_9[2]	),
		.b		(pd0_8[4]	),
		.ci		(pd0_7[6]	),
		.s		(pd1_3[8]	),
		.co		(pd1_0[9]	)
		);
	full_adder	fa_24(
		.a		(pd0_6[8]	),
		.b		(pd0_5[9]	),
		.ci		(pd0_4[9]	),
		.s		(pd1_4[8]	),
		.co		(pd1_1[9]	)
		);
	full_adder	fa_25(
		.a		(pd0_3[9]	),
		.b		(pd0_2[9]	),
		.ci		(pd0_1[9]	),
		.s		(pd1_5[6]	),
		.co		(pd1_2[9]	)
		);
	assign	pd1_6[2]	=	pd0_0[9];


	full_adder	fa_26(
		.a		(pd0_9[3]	),
		.b		(pd0_8[5]	),
		.ci		(pd0_7[7]	),
		.s		(pd1_3[9]	),
		.co		(pd1_0[10]	)
		);
	full_adder	fa_27(
		.a		(pd0_6[9]	),
		.b		(pd0_5[10]	),
		.ci		(pd0_4[10]	),
		.s		(pd1_4[9]	),
		.co		(pd1_1[10]	)
		);
	full_adder	fa_28(
		.a		(pd0_3[10]	),
		.b		(pd0_2[10]	),
		.ci		(pd0_1[10]	),
		.s		(pd1_5[7]	),
		.co		(pd1_2[10]	)
		);
	assign	pd1_6[3]	=	pd0_0[10];


	full_adder	fa_29(
		.a		(pd0_9[4]	),
		.b		(pd0_8[6]	),
		.ci		(pd0_7[8]	),
		.s		(pd1_3[10]	),
		.co		(pd1_0[11]	)
		);
	full_adder	fa_30(
		.a		(pd0_6[10]	),
		.b		(pd0_5[11]	),
		.ci		(pd0_4[11]	),
		.s		(pd1_4[10]	),
		.co		(pd1_1[11]	)
		);
	full_adder	fa_31(
		.a		(pd0_3[11]	),
		.b		(pd0_2[11]	),
		.ci		(pd0_1[11]	),
		.s		(pd1_5[8]	),
		.co		(pd1_2[11]	)
		);
	assign	pd1_6[4]	=	pd0_0[11];


	full_adder	fa_32(
		.a		(pd0_9[5]	),
		.b		(pd0_8[7]	),
		.ci		(pd0_7[9]	),
		.s		(pd1_3[11]	),
		.co		(pd1_0[12]	)
		);
	full_adder	fa_33(
		.a		(pd0_6[11]	),
		.b		(pd0_5[12]	),
		.ci		(pd0_4[12]	),
		.s		(pd1_4[11]	),
		.co		(pd1_1[12]	)
		);
	full_adder	fa_34(
		.a		(pd0_3[12]	),
		.b		(pd0_2[12]	),
		.ci		(pd0_1[12]	),
		.s		(pd1_5[9]	),
		.co		(pd1_2[12]	)
		);
	assign	pd1_6[5]	=	pd0_0[12];


	full_adder	fa_35(
		.a		(pd0_9[6]	),
		.b		(pd0_8[8]	),
		.ci		(pd0_7[10]	),
		.s		(pd1_3[12]	),
		.co		(pd1_0[13]	)
		);
	full_adder	fa_36(
		.a		(pd0_6[12]	),
		.b		(pd0_5[13]	),
		.ci		(pd0_4[13]	),
		.s		(pd1_4[12]	),
		.co		(pd1_1[13]	)
		);
	full_adder	fa_37(
		.a		(pd0_3[13]	),
		.b		(pd0_2[13]	),
		.ci		(pd0_1[13]	),
		.s		(pd1_5[10]	),
		.co		(pd1_2[13]	)
		);


	full_adder	fa_38(
		.a		(pd0_11[0]	),
		.b		(pd0_9[7]	),
		.ci		(pd0_8[9]	),
		.s		(pd1_3[13]	),
		.co		(pd1_0[14]	)
		);
	full_adder	fa_39(
		.a		(pd0_7[11]	),
		.b		(pd0_6[13]	),
		.ci		(pd0_5[14]	),
		.s		(pd1_4[13]	),
		.co		(pd1_1[14]	)
		);
	full_adder	fa_40(
		.a		(pd0_4[14]	),
		.b		(pd0_3[14]	),
		.ci		(pd0_2[14]	),
		.s		(pd1_5[11]	),
		.co		(pd1_2[14]	)
		);


	full_adder	fa_41(
		.a		(pd0_11[1]	),
		.b		(pd0_9[8]	),
		.ci		(pd0_8[10]	),
		.s		(pd1_3[14]	),
		.co		(pd1_0[15]	)
		);
	full_adder	fa_42(
		.a		(pd0_7[12]	),
		.b		(pd0_6[14]	),
		.ci		(pd0_5[15]	),
		.s		(pd1_4[14]	),
		.co		(pd1_1[15]	)
		);
	full_adder	fa_43(
		.a		(pd0_4[15]	),
		.b		(pd0_3[15]	),
		.ci		(pd0_2[15]	),
		.s		(pd1_5[12]	),
		.co		(pd1_2[15]	)
		);


	full_adder	fa_44(
		.a		(pd0_11[2]	),
		.b		(pd0_9[9]	),
		.ci		(pd0_8[11]	),
		.s		(pd1_3[15]	),
		.co		(pd1_0[16]	)
		);
	full_adder	fa_45(
		.a		(pd0_7[13]	),
		.b		(pd0_6[15]	),
		.ci		(pd0_5[16]	),
		.s		(pd1_4[15]	),
		.co		(pd1_1[16]	)
		);
	half_adder	ha_3(
		.a		(pd0_4[16]	),
		.b		(pd0_3[16]	),
		.s		(pd1_5[13]	),
		.co		(pd1_2[16]	)
		);


	full_adder	fa_46(
		.a		(pd0_11[3]	),
		.b		(pd0_9[10]	),
		.ci		(pd0_8[12]	),
		.s		(pd1_3[16]	),
		.co		(pd1_0[17]	)
		);
	full_adder	fa_47(
		.a		(pd0_7[14]	),
		.b		(pd0_6[16]	),
		.ci		(pd0_5[17]	),
		.s		(pd1_4[16]	),
		.co		(pd1_1[17]	)
		);
	half_adder	ha_4(
		.a		(pd0_4[17]	),
		.b		(pd0_3[17]	),
		.s		(pd1_5[14]	),
		.co		(pd1_2[17]	)
		);


	full_adder	fa_48(
		.a		(pd0_11[4]	),
		.b		(pd0_9[11]	),
		.ci		(pd0_8[13]	),
		.s		(pd1_3[17]	),
		.co		(pd1_0[18]	)
		);
	full_adder	fa_49(
		.a		(pd0_7[15]	),
		.b		(pd0_6[17]	),
		.ci		(pd0_5[18]	),
		.s		(pd1_4[17]	),
		.co		(pd1_1[18]	)
		);
	assign	pd1_5[15]	=	pd0_4[18];


	full_adder	fa_50(
		.a		(pd0_11[5]	),
		.b		(pd0_9[12]	),
		.ci		(pd0_8[14]	),
		.s		(pd1_2[18]	),
		.co		(pd1_0[19]	)
		);
	full_adder	fa_51(
		.a		(pd0_7[16]	),
		.b		(pd0_6[18]	),
		.ci		(pd0_5[19]	),
		.s		(pd1_3[18]	),
		.co		(pd1_1[19]	)
		);
	assign	pd1_4[18]	=	pd0_4[19];


	full_adder	fa_52(
		.a		(pd0_11[6]	),
		.b		(pd0_9[13]	),
		.ci		(pd0_8[15]	),
		.s		(pd1_2[19]	),
		.co		(pd1_0[20]	)
		);
	full_adder	fa_53(
		.a		(pd0_7[17]	),
		.b		(pd0_6[19]	),
		.ci		(pd0_5[20]	),
		.s		(pd1_3[19]	),
		.co		(pd1_1[20]	)
		);


	full_adder	fa_54(
		.a		(pd0_11[7]	),
		.b		(pd0_9[14]	),
		.ci		(pd0_8[16]	),
		.s		(pd1_2[20]	),
		.co		(pd1_0[21]	)
		);
	full_adder	fa_55(
		.a		(pd0_7[18]	),
		.b		(pd0_6[20]	),
		.ci		(pd0_5[21]	),
		.s		(pd1_3[20]	),
		.co		(pd1_1[21]	)
		);


	full_adder	fa_56(
		.a		(pd0_11[8]	),
		.b		(pd0_9[15]	),
		.ci		(pd0_8[17]	),
		.s		(pd1_2[21]	),
		.co		(pd1_0[22]	)
		);
	half_adder	ha_5(
		.a		(pd0_7[19]	),
		.b		(pd0_6[21]	),
		.s		(pd1_3[21]	),
		.co		(pd1_1[22]	)
		);


	full_adder	fa_57(
		.a		(pd0_11[9]	),
		.b		(pd0_9[16]	),
		.ci		(pd0_8[18]	),
		.s		(pd1_2[22]	),
		.co		(pd1_0[23]	)
		);
	half_adder	ha_6(
		.a		(pd0_7[20]	),
		.b		(pd0_6[22]	),
		.s		(pd1_3[22]	),
		.co		(pd1_1[23]	)
		);


	full_adder	fa_58(
		.a		(pd0_11[10]	),
		.b		(pd0_9[17]	),
		.ci		(pd0_8[19]	),
		.s		(pd1_2[23]	),
		.co		(pd1_0[24]	)
		);
	assign	pd1_3[23]	=	pd0_7[21];


	full_adder	fa_59(
		.a		(pd0_11[11]	),
		.b		(pd0_9[18]	),
		.ci		(pd0_8[20]	),
		.s		(pd1_1[24]	),
		.co		(pd1_0[25]	)
		);
	assign	pd1_2[24]	=	pd0_7[22];


	full_adder	fa_60(
		.a		(pd0_11[12]	),
		.b		(pd0_9[19]	),
		.ci		(pd0_8[21]	),
		.s		(pd1_1[25]	),
		.co		(pd1_0[26]	)
		);


	full_adder	fa_61(
		.a		(pd0_11[13]	),
		.b		(pd0_9[20]	),
		.ci		(pd0_8[22]	),
		.s		(pd1_1[26]	),
		.co		(pd1_0[27]	)
		);


	half_adder	ha_7(
		.a		(pd0_11[14]	),
		.b		(pd0_9[21]	),
		.s		(pd1_1[27]	),
		.co		(pd1_0[28]	)
		);


	half_adder	ha_8(
		.a		(pd0_11[15]	),
		.b		(pd0_9[22]	),
		.s		(pd1_1[28]	),
		.co		(pd1_0[29]	)
		);


	half_adder	ha_9(
		.a		(pd0_11[16]	),
		.b		(pd0_9[23]	),
		.s		(pd1_1[29]	),
		.co		(pd1_0[30]	)
		);


	half_adder	ha_10(
		.a		(pd0_11[17]	),
		.b		(pd0_9[24]	),
		.s		(pd1_1[30]	),
		.co		(pd1_0[31]	)
		);


	half_adder	ha_11(
		.a		(pd0_11[18]	),
		.b		(pd0_9[25]	),
		.s		(pd1_1[31]	),
		.co		()
		);


	full_adder	fa_62(
		.a		(pd1_0[0]	),
		.b		(pd1_1[0]	),
		.ci		(pd1_2[0]	),
		.s		(),
		.co		(pd2_0[0]	)
		);
	half_adder	ha_12(
		.a		(pd1_3[0]	),
		.b		(pd1_4[0]	),
		.s		(),
		.co		(pd2_1[0]	)
		);


	full_adder	fa_63(
		.a		(pd1_0[1]	),
		.b		(pd1_1[1]	),
		.ci		(pd1_2[1]	),
		.s		(pd2_2[0]	),
		.co		(pd2_0[1]	)
		);
	full_adder	fa_64(
		.a		(pd1_3[1]	),
		.b		(pd1_4[1]	),
		.ci		(pd1_5[0]	),
		.s		(pd2_3[0]	),
		.co		(pd2_1[1]	)
		);


	full_adder	fa_65(
		.a		(pd1_0[2]	),
		.b		(pd1_1[2]	),
		.ci		(pd1_2[2]	),
		.s		(pd2_2[1]	),
		.co		(pd2_0[2]	)
		);
	half_adder	ha_13(
		.a		(pd1_3[2]	),
		.b		(pd1_4[2]	),
		.s		(pd2_3[1]	),
		.co		(pd2_1[2]	)
		);


	full_adder	fa_66(
		.a		(pd1_0[3]	),
		.b		(pd1_1[3]	),
		.ci		(pd1_2[3]	),
		.s		(pd2_2[2]	),
		.co		(pd2_0[3]	)
		);
	full_adder	fa_67(
		.a		(pd1_3[3]	),
		.b		(pd1_4[3]	),
		.ci		(pd1_5[1]	),
		.s		(pd2_3[2]	),
		.co		(pd2_1[3]	)
		);


	full_adder	fa_68(
		.a		(pd1_0[4]	),
		.b		(pd1_1[4]	),
		.ci		(pd1_2[4]	),
		.s		(pd2_2[3]	),
		.co		(pd2_0[4]	)
		);
	full_adder	fa_69(
		.a		(pd1_3[4]	),
		.b		(pd1_4[4]	),
		.ci		(pd1_5[2]	),
		.s		(pd2_3[3]	),
		.co		(pd2_1[4]	)
		);


	full_adder	fa_70(
		.a		(pd1_0[5]	),
		.b		(pd1_1[5]	),
		.ci		(pd1_2[5]	),
		.s		(pd2_2[4]	),
		.co		(pd2_0[5]	)
		);
	full_adder	fa_71(
		.a		(pd1_3[5]	),
		.b		(pd1_4[5]	),
		.ci		(pd1_5[3]	),
		.s		(pd2_3[4]	),
		.co		(pd2_1[5]	)
		);


	full_adder	fa_72(
		.a		(pd1_0[6]	),
		.b		(pd1_1[6]	),
		.ci		(pd1_2[6]	),
		.s		(pd2_2[5]	),
		.co		(pd2_0[6]	)
		);
	full_adder	fa_73(
		.a		(pd1_3[6]	),
		.b		(pd1_4[6]	),
		.ci		(pd1_5[4]	),
		.s		(pd2_3[5]	),
		.co		(pd2_1[6]	)
		);
	assign	pd2_4[0]	=	pd1_6[0];


	full_adder	fa_74(
		.a		(pd1_0[7]	),
		.b		(pd1_1[7]	),
		.ci		(pd1_2[7]	),
		.s		(pd2_2[6]	),
		.co		(pd2_0[7]	)
		);
	full_adder	fa_75(
		.a		(pd1_3[7]	),
		.b		(pd1_4[7]	),
		.ci		(pd1_5[5]	),
		.s		(pd2_3[6]	),
		.co		(pd2_1[7]	)
		);
	assign	pd2_4[1]	=	pd1_6[1];
	assign	pd2_5[0]	=	pd1_7[0];


	assign	pd2_2[7]	=	pd1_6[2];
	assign	pd2_3[7]	=	pd1_5[6];
	full_adder	fa_76(
		.a		(pd1_4[8]	),
		.b		(pd1_3[8]	),
		.ci		(pd1_2[8]	),
		.s		(pd2_4[2]	),
		.co		(pd2_0[8]	)
		);
	half_adder	ha_14(
		.a		(pd1_1[8]	),
		.b		(pd1_0[8]	),
		.s		(pd2_5[1]	),
		.co		(pd2_1[8]	)
		);


	assign	pd2_2[8]	=	pd1_6[3];
	assign	pd2_3[8]	=	pd1_5[7];
	full_adder	fa_77(
		.a		(pd1_4[9]	),
		.b		(pd1_3[9]	),
		.ci		(pd1_2[9]	),
		.s		(pd2_4[3]	),
		.co		(pd2_0[9]	)
		);
	half_adder	ha_15(
		.a		(pd1_1[9]	),
		.b		(pd1_0[9]	),
		.s		(pd2_5[2]	),
		.co		(pd2_1[9]	)
		);


	assign	pd2_2[9]	=	pd1_6[4];
	assign	pd2_3[9]	=	pd1_5[8];
	full_adder	fa_78(
		.a		(pd1_4[10]	),
		.b		(pd1_3[10]	),
		.ci		(pd1_2[10]	),
		.s		(pd2_4[4]	),
		.co		(pd2_0[10]	)
		);
	half_adder	ha_16(
		.a		(pd1_1[10]	),
		.b		(pd1_0[10]	),
		.s		(pd2_5[3]	),
		.co		(pd2_1[10]	)
		);


	assign	pd2_2[10]	=	pd1_6[5];
	assign	pd2_3[10]	=	pd1_5[9];
	full_adder	fa_79(
		.a		(pd1_4[11]	),
		.b		(pd1_3[11]	),
		.ci		(pd1_2[11]	),
		.s		(pd2_4[5]	),
		.co		(pd2_0[11]	)
		);
	half_adder	ha_17(
		.a		(pd1_1[11]	),
		.b		(pd1_0[11]	),
		.s		(pd2_5[4]	),
		.co		(pd2_1[11]	)
		);


	assign	pd2_2[11]	=	pd1_5[10];
	assign	pd2_3[11]	=	pd1_4[12];
	full_adder	fa_80(
		.a		(pd1_3[12]	),
		.b		(pd1_2[12]	),
		.ci		(pd1_1[12]	),
		.s		(pd2_4[6]	),
		.co		(pd2_0[12]	)
		);
	assign	pd2_5[5]	=	pd1_0[12];


	assign	pd2_1[12]	=	pd1_5[11];
	assign	pd2_2[12]	=	pd1_4[13];
	full_adder	fa_81(
		.a		(pd1_3[13]	),
		.b		(pd1_2[13]	),
		.ci		(pd1_1[13]	),
		.s		(pd2_3[12]	),
		.co		(pd2_0[13]	)
		);
	assign	pd2_4[7]	=	pd1_0[13];


	assign	pd2_1[13]	=	pd1_5[12];
	assign	pd2_2[13]	=	pd1_4[14];
	full_adder	fa_82(
		.a		(pd1_3[14]	),
		.b		(pd1_2[14]	),
		.ci		(pd1_1[14]	),
		.s		(pd2_3[13]	),
		.co		(pd2_0[14]	)
		);
	assign	pd2_4[8]	=	pd1_0[14];


	assign	pd2_1[14]	=	pd1_5[13];
	assign	pd2_2[14]	=	pd1_4[15];
	full_adder	fa_83(
		.a		(pd1_3[15]	),
		.b		(pd1_2[15]	),
		.ci		(pd1_1[15]	),
		.s		(pd2_3[14]	),
		.co		(pd2_0[15]	)
		);
	assign	pd2_4[9]	=	pd1_0[15];


	assign	pd2_1[15]	=	pd1_5[14];
	assign	pd2_2[15]	=	pd1_4[16];
	full_adder	fa_84(
		.a		(pd1_3[16]	),
		.b		(pd1_2[16]	),
		.ci		(pd1_1[16]	),
		.s		(pd2_3[15]	),
		.co		(pd2_0[16]	)
		);
	assign	pd2_4[10]	=	pd1_0[16];


	assign	pd2_1[16]	=	pd1_5[15];
	assign	pd2_2[16]	=	pd1_4[17];
	full_adder	fa_85(
		.a		(pd1_3[17]	),
		.b		(pd1_2[17]	),
		.ci		(pd1_1[17]	),
		.s		(pd2_3[16]	),
		.co		(pd2_0[17]	)
		);
	assign	pd2_4[11]	=	pd1_0[17];


	assign	pd2_1[17]	=	pd1_4[18];
	assign	pd2_2[17]	=	pd1_3[18];
	full_adder	fa_86(
		.a		(pd1_2[18]	),
		.b		(pd1_1[18]	),
		.ci		(pd1_0[18]	),
		.s		(pd2_3[17]	),
		.co		(pd2_0[18]	)
		);


	assign	pd2_1[18]	=	pd1_3[19];
	assign	pd2_2[18]	=	pd1_2[19];
	half_adder	ha_18(
		.a		(pd1_1[19]	),
		.b		(pd1_0[19]	),
		.s		(pd2_3[18]	),
		.co		(pd2_0[19]	)
		);


	assign	pd2_1[19]	=	pd1_3[20];
	assign	pd2_2[19]	=	pd1_2[20];
	half_adder	ha_19(
		.a		(pd1_1[20]	),
		.b		(pd1_0[20]	),
		.s		(pd2_3[19]	),
		.co		(pd2_0[20]	)
		);


	assign	pd2_1[20]	=	pd1_3[21];
	assign	pd2_2[20]	=	pd1_2[21];
	half_adder	ha_20(
		.a		(pd1_1[21]	),
		.b		(pd1_0[21]	),
		.s		(pd2_3[20]	),
		.co		(pd2_0[21]	)
		);


	assign	pd2_1[21]	=	pd1_3[22];
	assign	pd2_2[21]	=	pd1_2[22];
	half_adder	ha_21(
		.a		(pd1_1[22]	),
		.b		(pd1_0[22]	),
		.s		(pd2_3[21]	),
		.co		(pd2_0[22]	)
		);


	assign	pd2_1[22]	=	pd1_3[23];
	assign	pd2_2[22]	=	pd1_2[23];
	half_adder	ha_22(
		.a		(pd1_1[23]	),
		.b		(pd1_0[23]	),
		.s		(pd2_3[22]	),
		.co		(pd2_0[23]	)
		);


	assign	pd2_1[23]	=	pd1_2[24];
	assign	pd2_2[23]	=	pd1_1[24];
	assign	pd2_3[23]	=	pd1_0[24];


	assign	pd2_0[24]	=	pd1_1[25];
	assign	pd2_1[24]	=	pd1_0[25];


	assign	pd2_0[25]	=	pd1_1[26];
	assign	pd2_1[25]	=	pd1_0[26];


	assign	pd2_0[26]	=	pd1_1[27];
	assign	pd2_1[26]	=	pd1_0[27];


	assign	pd2_0[27]	=	pd1_1[28];
	assign	pd2_1[27]	=	pd1_0[28];


	assign	pd2_0[28]	=	pd1_1[29];
	assign	pd2_1[28]	=	pd1_0[29];


	assign	pd2_0[29]	=	pd1_1[30];
	assign	pd2_1[29]	=	pd1_0[30];


	assign	pd2_0[30]	=	pd1_1[31];
	assign	pd2_1[30]	=	pd1_0[31];






	full_adder	fa_87(
		.a		(pd2_0[0]	),
		.b		(pd2_1[0]	),
		.ci		(pd2_2[0]	),
		.s		(pd3_0[0]	),
		.co		(pd3_0[1]	)
		);
	assign	pd3_1[0]	=	pd2_3[0];


	full_adder	fa_88(
		.a		(pd2_0[1]	),
		.b		(pd2_1[1]	),
		.ci		(pd2_2[1]	),
		.s		(pd3_1[1]	),
		.co		(pd3_0[2]	)
		);
	assign	pd3_2[0]	=	pd2_3[1];


	full_adder	fa_89(
		.a		(pd2_0[2]	),
		.b		(pd2_1[2]	),
		.ci		(pd2_2[2]	),
		.s		(pd3_1[2]	),
		.co		(pd3_0[3]	)
		);
	assign	pd3_2[1]	=	pd2_3[2];


	full_adder	fa_90(
		.a		(pd2_0[3]	),
		.b		(pd2_1[3]	),
		.ci		(pd2_2[3]	),
		.s		(pd3_1[3]	),
		.co		(pd3_0[4]	)
		);
	half_adder	ha_23(
		.a		(pd2_3[3]	),
		.b		(neg[8]	),
		.s		(pd3_2[2]	),
		.co		(pd3_1[4]	)
		);


	full_adder	fa_91(
		.a		(pd2_0[4]	),
		.b		(pd2_1[4]	),
		.ci		(pd2_2[4]	),
		.s		(pd3_2[3]	),
		.co		(pd3_0[5]	)
		);
	assign	pd3_3[0]	=	pd2_3[4];


	full_adder	fa_92(
		.a		(pd2_0[5]	),
		.b		(pd2_1[5]	),
		.ci		(pd2_2[5]	),
		.s		(pd3_1[5]	),
		.co		(pd3_0[6]	)
		);
	half_adder	ha_24(
		.a		(pd2_3[5]	),
		.b		(pd2_4[0]	),
		.s		(pd3_2[4]	),
		.co		(pd3_1[6]	)
		);


	full_adder	fa_93(
		.a		(pd2_0[6]	),
		.b		(pd2_1[6]	),
		.ci		(pd2_2[6]	),
		.s		(pd3_2[5]	),
		.co		(pd3_0[7]	)
		);
	full_adder	fa_94(
		.a		(pd2_3[6]	),
		.b		(pd2_4[1]	),
		.ci		(pd2_5[0]	),
		.s		(pd3_3[1]	),
		.co		(pd3_1[7]	)
		);


	full_adder	fa_95(
		.a		(pd2_0[7]	),
		.b		(pd2_1[7]	),
		.ci		(pd2_2[7]	),
		.s		(pd3_2[6]	),
		.co		(pd3_0[8]	)
		);
	full_adder	fa_96(
		.a		(pd2_3[7]	),
		.b		(pd2_4[2]	),
		.ci		(pd2_5[1]	),
		.s		(pd3_3[2]	),
		.co		(pd3_1[8]	)
		);


	full_adder	fa_97(
		.a		(pd2_0[8]	),
		.b		(pd2_1[8]	),
		.ci		(pd2_2[8]	),
		.s		(pd3_2[7]	),
		.co		(pd3_0[9]	)
		);
	full_adder	fa_98(
		.a		(pd2_3[8]	),
		.b		(pd2_4[3]	),
		.ci		(pd2_5[2]	),
		.s		(pd3_3[3]	),
		.co		(pd3_1[9]	)
		);


	full_adder	fa_99(
		.a		(pd2_0[9]	),
		.b		(pd2_1[9]	),
		.ci		(pd2_2[9]	),
		.s		(pd3_2[8]	),
		.co		(pd3_0[10]	)
		);
	full_adder	fa_100(
		.a		(pd2_3[9]	),
		.b		(pd2_4[4]	),
		.ci		(pd2_5[3]	),
		.s		(pd3_3[4]	),
		.co		(pd3_1[10]	)
		);


	full_adder	fa_101(
		.a		(pd2_0[10]	),
		.b		(pd2_1[10]	),
		.ci		(pd2_2[10]	),
		.s		(pd3_2[9]	),
		.co		(pd3_0[11]	)
		);
	full_adder	fa_102(
		.a		(pd2_3[10]	),
		.b		(pd2_4[5]	),
		.ci		(pd2_5[4]	),
		.s		(pd3_3[5]	),
		.co		(pd3_1[11]	)
		);


	full_adder	fa_103(
		.a		(pd2_0[11]	),
		.b		(pd2_1[11]	),
		.ci		(pd2_2[11]	),
		.s		(pd3_2[10]	),
		.co		(pd3_0[12]	)
		);
	full_adder	fa_104(
		.a		(pd2_3[11]	),
		.b		(pd2_4[6]	),
		.ci		(pd2_5[5]	),
		.s		(pd3_3[6]	),
		.co		(pd3_1[12]	)
		);


	full_adder	fa_105(
		.a		(pd2_4[7]	),
		.b		(pd2_3[12]	),
		.ci		(pd2_2[12]	),
		.s		(pd3_2[11]	),
		.co		(pd3_0[13]	)
		);
	half_adder	ha_25(
		.a		(pd2_1[12]	),
		.b		(pd2_0[12]	),
		.s		(pd3_3[7]	),
		.co		(pd3_1[13]	)
		);


	full_adder	fa_106(
		.a		(pd2_4[8]	),
		.b		(pd2_3[13]	),
		.ci		(pd2_2[13]	),
		.s		(pd3_2[12]	),
		.co		(pd3_0[14]	)
		);
	half_adder	ha_26(
		.a		(pd2_1[13]	),
		.b		(pd2_0[13]	),
		.s		(pd3_3[8]	),
		.co		(pd3_1[14]	)
		);


	full_adder	fa_107(
		.a		(pd2_4[9]	),
		.b		(pd2_3[14]	),
		.ci		(pd2_2[14]	),
		.s		(pd3_2[13]	),
		.co		(pd3_0[15]	)
		);
	half_adder	ha_27(
		.a		(pd2_1[14]	),
		.b		(pd2_0[14]	),
		.s		(pd3_3[9]	),
		.co		(pd3_1[15]	)
		);


	full_adder	fa_108(
		.a		(pd2_4[10]	),
		.b		(pd2_3[15]	),
		.ci		(pd2_2[15]	),
		.s		(pd3_2[14]	),
		.co		(pd3_0[16]	)
		);
	half_adder	ha_28(
		.a		(pd2_1[15]	),
		.b		(pd2_0[15]	),
		.s		(pd3_3[10]	),
		.co		(pd3_1[16]	)
		);


	full_adder	fa_109(
		.a		(pd2_4[11]	),
		.b		(pd2_3[16]	),
		.ci		(pd2_2[16]	),
		.s		(pd3_2[15]	),
		.co		(pd3_0[17]	)
		);
	half_adder	ha_29(
		.a		(pd2_1[16]	),
		.b		(pd2_0[16]	),
		.s		(pd3_3[11]	),
		.co		(pd3_1[17]	)
		);


	full_adder	fa_110(
		.a		(pd2_3[17]	),
		.b		(pd2_2[17]	),
		.ci		(pd2_1[17]	),
		.s		(pd3_2[16]	),
		.co		(pd3_0[18]	)
		);
	assign	pd3_3[12]	=	pd2_0[17];


	full_adder	fa_111(
		.a		(pd2_3[18]	),
		.b		(pd2_2[18]	),
		.ci		(pd2_1[18]	),
		.s		(pd3_1[18]	),
		.co		(pd3_0[19]	)
		);
	assign	pd3_2[17]	=	pd2_0[18];


	full_adder	fa_112(
		.a		(pd2_3[19]	),
		.b		(pd2_2[19]	),
		.ci		(pd2_1[19]	),
		.s		(pd3_1[19]	),
		.co		(pd3_0[20]	)
		);
	assign	pd3_2[18]	=	pd2_0[19];


	full_adder	fa_113(
		.a		(pd2_3[20]	),
		.b		(pd2_2[20]	),
		.ci		(pd2_1[20]	),
		.s		(pd3_1[20]	),
		.co		(pd3_0[21]	)
		);
	assign	pd3_2[19]	=	pd2_0[20];


	full_adder	fa_114(
		.a		(pd2_3[21]	),
		.b		(pd2_2[21]	),
		.ci		(pd2_1[21]	),
		.s		(pd3_1[21]	),
		.co		(pd3_0[22]	)
		);
	assign	pd3_2[20]	=	pd2_0[21];


	full_adder	fa_115(
		.a		(pd2_3[22]	),
		.b		(pd2_2[22]	),
		.ci		(pd2_1[22]	),
		.s		(pd3_1[22]	),
		.co		(pd3_0[23]	)
		);
	assign	pd3_2[21]	=	pd2_0[22];


	full_adder	fa_116(
		.a		(pd2_3[23]	),
		.b		(pd2_2[23]	),
		.ci		(pd2_1[23]	),
		.s		(pd3_1[23]	),
		.co		(pd3_0[24]	)
		);
	assign	pd3_2[22]	=	pd2_0[23];


	half_adder	ha_30(
		.a		(pd2_1[24]	),
		.b		(pd2_0[24]	),
		.s		(pd3_1[24]	),
		.co		(pd3_0[25]	)
		);


	half_adder	ha_31(
		.a		(pd2_1[25]	),
		.b		(pd2_0[25]	),
		.s		(pd3_1[25]	),
		.co		(pd3_0[26]	)
		);


	half_adder	ha_32(
		.a		(pd2_1[26]	),
		.b		(pd2_0[26]	),
		.s		(pd3_1[26]	),
		.co		(pd3_0[27]	)
		);


	half_adder	ha_33(
		.a		(pd2_1[27]	),
		.b		(pd2_0[27]	),
		.s		(pd3_1[27]	),
		.co		(pd3_0[28]	)
		);


	half_adder	ha_34(
		.a		(pd2_1[28]	),
		.b		(pd2_0[28]	),
		.s		(pd3_1[28]	),
		.co		(pd3_0[29]	)
		);


	half_adder	ha_35(
		.a		(pd2_1[29]	),
		.b		(pd2_0[29]	),
		.s		(pd3_1[29]	),
		.co		(pd3_0[30]	)
		);


	half_adder	ha_36(
		.a		(pd2_1[30]	),
		.b		(pd2_0[30]	),
		.s		(pd3_1[30]	),
		.co		()
		);






	half_adder	ha_37(
		.a		(pd3_0[0]	),
		.b		(pd3_1[0]	),
		.s		(pd4_0[0]	),
		.co		(pd4_0[1]	)
		);


	full_adder	fa_117(
		.a		(pd3_0[1]	),
		.b		(pd3_1[1]	),
		.ci		(pd3_2[0]	),
		.s		(pd4_1[0]	),
		.co		(pd4_0[2]	)
		);


	full_adder	fa_118(
		.a		(pd3_0[2]	),
		.b		(pd3_1[2]	),
		.ci		(pd3_2[1]	),
		.s		(pd4_1[1]	),
		.co		(pd4_0[3]	)
		);


	full_adder	fa_119(
		.a		(pd3_0[3]	),
		.b		(pd3_1[3]	),
		.ci		(pd3_2[2]	),
		.s		(pd4_1[2]	),
		.co		(pd4_0[4]	)
		);


	full_adder	fa_120(
		.a		(pd3_0[4]	),
		.b		(pd3_1[4]	),
		.ci		(pd3_2[3]	),
		.s		(pd4_1[3]	),
		.co		(pd4_0[5]	)
		);
	assign	pd4_2[0]	=	pd3_3[0];


	full_adder	fa_121(
		.a		(pd3_0[5]	),
		.b		(pd3_1[5]	),
		.ci		(pd3_2[4]	),
		.s		(pd4_1[4]	),
		.co		(pd4_0[6]	)
		);


	full_adder	fa_122(
		.a		(pd3_0[6]	),
		.b		(pd3_1[6]	),
		.ci		(pd3_2[5]	),
		.s		(pd4_1[5]	),
		.co		(pd4_0[7]	)
		);
	assign	pd4_2[1]	=	pd3_3[1];


	full_adder	fa_123(
		.a		(pd3_0[7]	),
		.b		(pd3_1[7]	),
		.ci		(pd3_2[6]	),
		.s		(pd4_1[6]	),
		.co		(pd4_0[8]	)
		);
	assign	pd4_2[2]	=	pd3_3[2];


	full_adder	fa_124(
		.a		(pd3_0[8]	),
		.b		(pd3_1[8]	),
		.ci		(pd3_2[7]	),
		.s		(pd4_1[7]	),
		.co		(pd4_0[9]	)
		);
	assign	pd4_2[3]	=	pd3_3[3];


	full_adder	fa_125(
		.a		(pd3_0[9]	),
		.b		(pd3_1[9]	),
		.ci		(pd3_2[8]	),
		.s		(pd4_1[8]	),
		.co		(pd4_0[10]	)
		);
	assign	pd4_2[4]	=	pd3_3[4];


	full_adder	fa_126(
		.a		(pd3_0[10]	),
		.b		(pd3_1[10]	),
		.ci		(pd3_2[9]	),
		.s		(pd4_1[9]	),
		.co		(pd4_0[11]	)
		);
	assign	pd4_2[5]	=	pd3_3[5];


	full_adder	fa_127(
		.a		(pd3_0[11]	),
		.b		(pd3_1[11]	),
		.ci		(pd3_2[10]	),
		.s		(pd4_1[10]	),
		.co		(pd4_0[12]	)
		);
	assign	pd4_2[6]	=	pd3_3[6];


	full_adder	fa_128(
		.a		(pd3_0[12]	),
		.b		(pd3_1[12]	),
		.ci		(pd3_2[11]	),
		.s		(pd4_1[11]	),
		.co		(pd4_0[13]	)
		);
	assign	pd4_2[7]	=	pd3_3[7];


	full_adder	fa_129(
		.a		(pd3_0[13]	),
		.b		(pd3_1[13]	),
		.ci		(pd3_2[12]	),
		.s		(pd4_1[12]	),
		.co		(pd4_0[14]	)
		);
	assign	pd4_2[8]	=	pd3_3[8];


	full_adder	fa_130(
		.a		(pd3_0[14]	),
		.b		(pd3_1[14]	),
		.ci		(pd3_2[13]	),
		.s		(pd4_1[13]	),
		.co		(pd4_0[15]	)
		);
	assign	pd4_2[9]	=	pd3_3[9];


	full_adder	fa_131(
		.a		(pd3_0[15]	),
		.b		(pd3_1[15]	),
		.ci		(pd3_2[14]	),
		.s		(pd4_1[14]	),
		.co		(pd4_0[16]	)
		);
	assign	pd4_2[10]	=	pd3_3[10];


	full_adder	fa_132(
		.a		(pd3_0[16]	),
		.b		(pd3_1[16]	),
		.ci		(pd3_2[15]	),
		.s		(pd4_1[15]	),
		.co		(pd4_0[17]	)
		);
	assign	pd4_2[11]	=	pd3_3[11];


	full_adder	fa_133(
		.a		(pd3_0[17]	),
		.b		(pd3_1[17]	),
		.ci		(pd3_2[16]	),
		.s		(pd4_1[16]	),
		.co		(pd4_0[18]	)
		);
	assign	pd4_2[12]	=	pd3_3[12];


	assign	pd4_1[17]	=	pd3_2[17];
	half_adder	ha_38(
		.a		(pd3_1[18]	),
		.b		(pd3_0[18]	),
		.s		(pd4_2[13]	),
		.co		(pd4_0[19]	)
		);


	assign	pd4_1[18]	=	pd3_2[18];
	half_adder	ha_39(
		.a		(pd3_1[19]	),
		.b		(pd3_0[19]	),
		.s		(pd4_2[14]	),
		.co		(pd4_0[20]	)
		);


	assign	pd4_1[19]	=	pd3_2[19];
	half_adder	ha_40(
		.a		(pd3_1[20]	),
		.b		(pd3_0[20]	),
		.s		(pd4_2[15]	),
		.co		(pd4_0[21]	)
		);


	assign	pd4_1[20]	=	pd3_2[20];
	half_adder	ha_41(
		.a		(pd3_1[21]	),
		.b		(pd3_0[21]	),
		.s		(pd4_2[16]	),
		.co		(pd4_0[22]	)
		);


	assign	pd4_1[21]	=	pd3_2[21];
	half_adder	ha_42(
		.a		(pd3_1[22]	),
		.b		(pd3_0[22]	),
		.s		(pd4_2[17]	),
		.co		(pd4_0[23]	)
		);


	assign	pd4_1[22]	=	pd3_2[22];
	half_adder	ha_43(
		.a		(pd3_1[23]	),
		.b		(pd3_0[23]	),
		.s		(pd4_2[18]	),
		.co		(pd4_0[24]	)
		);


	assign	pd4_1[23]	=	pd3_1[24];
	assign	pd4_2[19]	=	pd3_0[24];


	assign	pd4_0[25]	=	pd3_1[25];
	assign	pd4_1[24]	=	pd3_0[25];


	assign	pd4_0[26]	=	pd3_1[26];
	assign	pd4_1[25]	=	pd3_0[26];


	assign	pd4_0[27]	=	pd3_1[27];
	assign	pd4_1[26]	=	pd3_0[27];


	assign	pd4_0[28]	=	pd3_1[28];
	assign	pd4_1[27]	=	pd3_0[28];


	assign	pd4_0[29]	=	pd3_1[29];
	assign	pd4_1[28]	=	pd3_0[29];


	assign	pd4_0[30]	=	pd3_1[30];
	assign	pd4_1[29]	=	pd3_0[30];






	assign	pd5_0[0]	=	pd4_0[0];


	half_adder	ha_44(
		.a		(pd4_0[1]	),
		.b		(pd4_1[0]	),
		.s		(pd5_0[1]	),
		.co		(pd5_0[2]	)
		);


	half_adder	ha_45(
		.a		(pd4_0[2]	),
		.b		(pd4_1[1]	),
		.s		(pd5_1[0]	),
		.co		(pd5_0[3]	)
		);


	half_adder	ha_46(
		.a		(pd4_0[3]	),
		.b		(pd4_1[2]	),
		.s		(pd5_1[1]	),
		.co		(pd5_0[4]	)
		);


	full_adder	fa_134(
		.a		(pd4_0[4]	),
		.b		(pd4_1[3]	),
		.ci		(pd4_2[0]	),
		.s		(pd5_1[2]	),
		.co		(pd5_0[5]	)
		);


	half_adder	ha_47(
		.a		(pd4_0[5]	),
		.b		(pd4_1[4]	),
		.s		(pd5_1[3]	),
		.co		(pd5_0[6]	)
		);


	full_adder	fa_135(
		.a		(pd4_0[6]	),
		.b		(pd4_1[5]	),
		.ci		(pd4_2[1]	),
		.s		(pd5_1[4]	),
		.co		(pd5_0[7]	)
		);


	full_adder	fa_136(
		.a		(pd4_0[7]	),
		.b		(pd4_1[6]	),
		.ci		(pd4_2[2]	),
		.s		(pd5_1[5]	),
		.co		(pd5_0[8]	)
		);


	full_adder	fa_137(
		.a		(pd4_0[8]	),
		.b		(pd4_1[7]	),
		.ci		(pd4_2[3]	),
		.s		(pd5_1[6]	),
		.co		(pd5_0[9]	)
		);


	full_adder	fa_138(
		.a		(pd4_0[9]	),
		.b		(pd4_1[8]	),
		.ci		(pd4_2[4]	),
		.s		(pd5_1[7]	),
		.co		(pd5_0[10]	)
		);


	full_adder	fa_139(
		.a		(pd4_0[10]	),
		.b		(pd4_1[9]	),
		.ci		(pd4_2[5]	),
		.s		(pd5_1[8]	),
		.co		(pd5_0[11]	)
		);


	full_adder	fa_140(
		.a		(pd4_0[11]	),
		.b		(pd4_1[10]	),
		.ci		(pd4_2[6]	),
		.s		(pd5_1[9]	),
		.co		(pd5_0[12]	)
		);


	full_adder	fa_141(
		.a		(pd4_0[12]	),
		.b		(pd4_1[11]	),
		.ci		(pd4_2[7]	),
		.s		(pd5_1[10]	),
		.co		(pd5_0[13]	)
		);


	full_adder	fa_142(
		.a		(pd4_0[13]	),
		.b		(pd4_1[12]	),
		.ci		(pd4_2[8]	),
		.s		(pd5_1[11]	),
		.co		(pd5_0[14]	)
		);


	full_adder	fa_143(
		.a		(pd4_0[14]	),
		.b		(pd4_1[13]	),
		.ci		(pd4_2[9]	),
		.s		(pd5_1[12]	),
		.co		(pd5_0[15]	)
		);


	full_adder	fa_144(
		.a		(pd4_0[15]	),
		.b		(pd4_1[14]	),
		.ci		(pd4_2[10]	),
		.s		(pd5_1[13]	),
		.co		(pd5_0[16]	)
		);


	full_adder	fa_145(
		.a		(pd4_0[16]	),
		.b		(pd4_1[15]	),
		.ci		(pd4_2[11]	),
		.s		(pd5_1[14]	),
		.co		(pd5_0[17]	)
		);


	full_adder	fa_146(
		.a		(pd4_0[17]	),
		.b		(pd4_1[16]	),
		.ci		(pd4_2[12]	),
		.s		(pd5_1[15]	),
		.co		(pd5_0[18]	)
		);


	full_adder	fa_147(
		.a		(pd4_0[18]	),
		.b		(pd4_1[17]	),
		.ci		(pd4_2[13]	),
		.s		(pd5_1[16]	),
		.co		(pd5_0[19]	)
		);


	full_adder	fa_148(
		.a		(pd4_0[19]	),
		.b		(pd4_1[18]	),
		.ci		(pd4_2[14]	),
		.s		(pd5_1[17]	),
		.co		(pd5_0[20]	)
		);


	full_adder	fa_149(
		.a		(pd4_0[20]	),
		.b		(pd4_1[19]	),
		.ci		(pd4_2[15]	),
		.s		(pd5_1[18]	),
		.co		(pd5_0[21]	)
		);


	full_adder	fa_150(
		.a		(pd4_0[21]	),
		.b		(pd4_1[20]	),
		.ci		(pd4_2[16]	),
		.s		(pd5_1[19]	),
		.co		(pd5_0[22]	)
		);


	full_adder	fa_151(
		.a		(pd4_0[22]	),
		.b		(pd4_1[21]	),
		.ci		(pd4_2[17]	),
		.s		(pd5_1[20]	),
		.co		(pd5_0[23]	)
		);


	full_adder	fa_152(
		.a		(pd4_0[23]	),
		.b		(pd4_1[22]	),
		.ci		(pd4_2[18]	),
		.s		(pd5_1[21]	),
		.co		(pd5_0[24]	)
		);


	full_adder	fa_153(
		.a		(pd4_0[24]	),
		.b		(pd4_1[23]	),
		.ci		(pd4_2[19]	),
		.s		(pd5_1[22]	),
		.co		(pd5_0[25]	)
		);


	half_adder	ha_48(
		.a		(pd4_1[24]	),
		.b		(pd4_0[25]	),
		.s		(pd5_1[23]	),
		.co		(pd5_0[26]	)
		);


	half_adder	ha_49(
		.a		(pd4_1[25]	),
		.b		(pd4_0[26]	),
		.s		(pd5_1[24]	),
		.co		(pd5_0[27]	)
		);


	half_adder	ha_50(
		.a		(pd4_1[26]	),
		.b		(pd4_0[27]	),
		.s		(pd5_1[25]	),
		.co		(pd5_0[28]	)
		);


	half_adder	ha_51(
		.a		(pd4_1[27]	),
		.b		(pd4_0[28]	),
		.s		(pd5_1[26]	),
		.co		(pd5_0[29]	)
		);


	half_adder	ha_52(
		.a		(pd4_1[28]	),
		.b		(pd4_0[29]	),
		.s		(pd5_1[27]	),
		.co		(pd5_0[30]	)
		);


	half_adder	ha_53(
		.a		(pd4_1[29]	),
		.b		(pd4_0[30]	),
		.s		(pd5_1[28]	),
		.co		()
		);



    
    
    
    
    
    
    
    
endmodule
