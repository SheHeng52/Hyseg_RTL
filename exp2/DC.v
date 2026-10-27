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
    wire    [25:0]	c;

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
    
    wire	[31:0]		pd5_0;
    wire	[26:0]		pd5_1;
    
    booth_add_one u_booth_add_one(
        .pd    (pd),
        .neg   (neg),
        .b     (b),
        .pd5_0 (pd5_0),
        .pd5_1 (pd5_1)
    );
    
    
    wire [30:0] s_add;
    wire [30:0] c_add;
   
    assign s_add   =  pd5_0[31:1];
    assign c_add   =  {1'b0,pd5_1[26:0],3'b000};
    

    wire	[46:0]		mb;
    
    smb2	u_smb2(
		.s				(s_add	),
		.c              (c_add	),
		.mb			    (mb		)
	);
    
    wire	[39:0]		z;
    
    booth_mul u2_booth_mul(
		.mb			(mb		),
		.x			(xc		),
		.z			(z		)
	);
	
	wire   [36:0]    y_old;
	assign y_old = z[36:0] + {c,11'b0};
	assign y     = y_old[36:13]+y_old[12];
    
    
    
    
  endmodule