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


module smb2(
    input [25:0] s	,
    input [25:0] c ,
    output [39:0] mb
    );
	
	wire	[24:0]		co;
	
	cp1_1 u_cp1_1(
    .a				(s[1:0]),
    .b				(c[1]),
	.s				(mb[1:0]),
    .co             (co[0])
    );
	
	cp1_2 u_cp1_2(
    .a				(s[3:2]),
    .b				(c[3:2]),
	.ci				(co[0]),
	.s				(mb[4:2]),
    .co	            (co[2:1])
    );
	
	genvar i;
	generate
		for(i=0; i<10; i=i+1) begin:loop1
			unit_2	u_unit_1(
				.a				(s[i*2+5:i*2+4]	),		
				.b				(c[i*2+5:i*2+4]	),		
				.ci				(co[i*2+2:i*2+1]),		
				.s				(mb[i*3+7:i*3+5]),		
				.co				(co[i*2+4:i*2+3])		
				);			
		end
	endgenerate	
	
	unit_2	u1_unit_1(
		.a				(s[25:24]	),		
		.b				(c[25:24]	),		
		.ci				(co[22:21]),		
		.s				(mb[37:35]),		
		.co				(co[24:23])		
		);
	
	
	assign mb[38] = co[23];
	assign mb[39] = co[24];
//	fa_2s  u_fa_2s(
//	    .a             (s[30]),
//	    .b             (c[30]),
//	    .c             (co[27]),
//	    .cc            (mb[46]),
//	    .s             (mb[45])
//	);
	
	
	endmodule