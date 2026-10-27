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
    wire    [9:0]  a;
    wire    [15:0]  b;
    wire    [24:0]	c;

    PPA   u_PPA(
         .x  (x),
         .a  (a),
         .b  (b),
         .c  (c)
       
    );

    wire	[18:0]	xc;
   
	assign	xc	=	x[18:0]	;
	
	wire    [132:0] pd;
    wire    [5:0]   neg;
   
    booth_one u_booth_one (
        .k   (a),
        .x   (xc),
        .pd  (pd),
        .neg (neg)
    );
    
    wire [29:0]   pd4_0;
    wire [26:0]   pd4_1;
    
    booth_add_one u_booth_add_one(
        .pd    (pd),
        .neg   (neg),
        .b     (b),
        .pd4_0 (pd4_0),
        .pd4_1 (pd4_1)
    );
    
    
    wire [27:0] s_add;
    wire [27:0] c_add;
   
    assign s_add   =  pd4_0[28:1];
    assign c_add   =  {pd4_1[25:0],2'b00};
    
    

    wire	[42:0]		mb;
    
    smb2	u_smb2(
		.s				(s_add	),
		.c              (c_add	),
		.mb			    (mb		)
	);
    
    wire	[37:0]		z;
    
    booth_mul u2_booth_mul(
		.mb			(mb		),
		.x			(xc		),
		.z			(z		)
	);
	
	
	wire   [38:0]    y_old;
	assign y_old = {c,13'b0} - z;
	assign y     = y_old[38:15]+y_old[14];
    
    
    
    
  endmodule