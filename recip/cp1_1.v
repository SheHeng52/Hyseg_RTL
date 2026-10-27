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


module cp1_1(
    input 	[1:0] 	a,
    input 	 	b,
//	input 	[1:0]	ci,
	output	[1:0]	s,
    output 	 	co
    );
	
//	wire	co1;
	
	ha_1s	u_ha_1s(
	.a			(a[1]),
	.b          (b),
//	.ci         (ci[0]),
	.co         (co),
	.s          (s[1])
	);
	
	
	assign		s[0]		=	a[0];	


endmodule