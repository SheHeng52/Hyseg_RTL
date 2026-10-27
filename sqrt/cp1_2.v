`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/07 23:10:38
// Design Name: 
// Module Name: top
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


module cp1_2(
    input 	[1:0] 	a,
    input 	[1:0] 	b,
	input 		ci,
	output	[2:0]	s,
    output 	[1:0] 	co
    );
	
	assign	s[0]	=	ci;
	assign	co[0]	=	b[1];
	
	wire	co1;
	
	ha	u_ha(
	.a			(a[0]),
	.b          (b[0]),
//	.ci         (ci[0]),
	.co         (co1),
	.s          (s[1])
	);
	
	fa_1s	u_fa_1s(
	.a			(a[1]),
	.b          (b[1]),
	.ci         (co1),
	.co         (co[1]),
	.s          (s[2])
	);	
		


endmodule