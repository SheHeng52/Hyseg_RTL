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
    input [31:0] s	,
    input [31:0] c ,
    output [48:0] mb
    );
	
	wire	[30:0]		co;
	
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
		for(i=0; i<13; i=i+1) begin:loop1
			unit_2	u_unit_1(
				.a				(s[i*2+5:i*2+4]	),		//29-28
				.b				(c[i*2+5:i*2+4]	),		//28-27
				.ci				(co[i*2+2:i*2+1]),		//26-25
				.s				(mb[i*3+7:i*3+5]),		//43-41
				.co				(co[i*2+4:i*2+3])		//28-27
				);			
		end
	endgenerate	
	
	unit_1	u_unit_1(
		.a				(s[31:30]	),		
		.b				(c[31:30]	),		
		.ci				(co[28:27]),		
		.s				(mb[46:44]),		
		.co				(co[30:29])		
		);
	
	
	assign mb[47] = co[29];
	assign mb[48] = co[30];
	
	
	
	endmodule