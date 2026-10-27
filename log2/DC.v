`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 

// 
// Create Date: 2026/04/15 21:08:46
// Design Name: 
// Module Name: DC
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


module DC(
    input	[23:0]	x,
	output	[23:0]	y
    );
    wire    [14:0]  a;
    wire    [20:0]  b;
    wire    [26:0]	c;

    PPA   u_PPA(
         .x  (x),
         .a  (a),
         .b  (b),
         .c  (c)
       
    );

    wire	[19:0]	xc;
   
	assign	xc	=	x[19:0]	;
	
	wire    [184:0] pd;
    wire    [7:0]   neg;
   
    booth_one u_booth_one (
        .k   (a),
        .x   (xc),
        .pd  (pd),
        .neg (neg)
    );
    
    wire	[28:0]		pd5_0;
    wire	[23:0]		pd5_1;
    
    booth_add_one u_booth_add_one(
        .pd    (pd),
        .neg   (neg),
        .b     (b),
        .pd5_0 (pd5_0),
        .pd5_1 (pd5_1)
    );
    
    
    wire [27:0] ppp;
    
    assign ppp = {pd5_1,4'b0};
    
    wire [27:0] s_add;
    wire [27:0] c_add;
   
    assign s_add   = pd5_0[27:0];
    assign c_add =   ppp[27:0];
    
//    assign pp = pd4_0 + ppp;
//    assign pp = s_add + c_add;
   
    wire	[43:0]		mb;
    
    smb2	u_smb2(
		.s				(s_add	),
		.c              (c_add	),
		.mb			    (mb		)
	);
    
    wire	[34:0]		z;
    
    booth_mul u2_booth_mul(
		.mb			(mb		),
		.x			(xc		),
		.z			(z		)
	);
	
	wire   [34:0]    y_old;
	assign y_old = z + {c,7'b0};
	assign y     = y_old[34:11]+y_old[10];
    
    
    
    
  endmodule