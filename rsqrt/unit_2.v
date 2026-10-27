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


module unit_2(
    input 	[1:0] 	a,
    input 	[1:0] 	b,
	input 	[1:0]	ci,
	output	[2:0]	s,
    output 	[1:0] 	co
    );
	
	wire	co1;
	
	fa	u_fa(
	.a			(a[0]),
	.b          (b[0]),
	.ci         (ci[0]),
	.co         (co1),
	.s          (s[1])
	);
	
	wire		s_ha;
	
	ha	u1_ha(
	.a			(a[1]),
	.b          (b[1]),
	.co         (co[0]),
	.s          (s_ha)
	);
	
	ha_1s	u2_ha_1s(
	.a			(s_ha),
	.b          (co1),
	.co         (co[1]),
	.s          (s[2])
	);
		
	
	assign	s[0]		=		ci[1];	


endmodule