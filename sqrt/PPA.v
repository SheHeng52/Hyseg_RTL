`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/19 10:50:56
// Design Name: 
// Module Name: PPA
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


module PPA(
    input	[23:0]	x,
	output	[12:0]	a,
	
	output	[17:0]	b,
	
	output	[28:0]	c
    );
    

    
    localparam [23:0]  coef_seg1 = 24'b011111_010111_001111_001000;
    localparam [23:0]  coef_seg2 = 24'b100000_011000_010000_001000;
    localparam [23:0]  coef_seg3 = 24'b100000_011011_010010_001001;            
    localparam [23:0]  coef_seg4 = 24'b100000_011100_010010_001010;            
    localparam [23:0]  coef_seg5 = 24'b100000_100000_010101_001011;    
    localparam [23:0]  coef_seg6 = 24'b100000_100000_010110_001011;    
    localparam [23:0]  coef_seg7 = 24'b100000_100000_010111_001100;    
    localparam [23:0]  coef_seg8 = 24'b100000_100000_011001_001101;
    reg [23:0]  coef_seg;
    
    always@(*)
	begin
		case(x[22:20]) 
              3'b000: begin  
                     
                     coef_seg = coef_seg1;
                         
              end
              3'b001: begin  
                     
                     coef_seg = coef_seg2;
                         
              end
              3'b010: begin  
                     
                     coef_seg = coef_seg3;
                         
              end
              3'b011: begin  
                     
                     coef_seg = coef_seg4;
                         
              end
              3'b100: begin  
                     
                     coef_seg = coef_seg5;
                         
              end
              3'b101: begin  
                     
                     coef_seg = coef_seg6;
                         
              end  
              3'b110: begin  
                     
                     coef_seg = coef_seg7;
                         
              end
              3'b111: begin  
                     
                     coef_seg = coef_seg8;
                         
              end
              
        endcase 
    end         
    wire [5:0] sign1;
    wire [5:0] sign2;
    wire [5:0] sign3;
    wire [5:0] sign4;
    
    
    wire [5:0]   coef_seg1_1 ;
    wire [5:0]   coef_seg1_2 ;
    wire [5:0]   coef_seg1_3 ;
    wire [5:0]   coef_seg1_4 ;
   
    
    assign coef_seg1_1 = coef_seg[5:0];
    assign coef_seg1_2 = coef_seg[11:6];
    assign coef_seg1_3 = coef_seg[17:12];
    assign coef_seg1_4 = coef_seg[23:18];
   
    assign  sign1 = (x[19:15] - coef_seg1_1);
    assign  sign2 = (x[19:15] - coef_seg1_2);
    assign  sign3 = (x[19:15] - coef_seg1_3);
    assign  sign4 = (x[19:15] - coef_seg1_4);
   
   
    wire [3:0] sign_bits;
    assign	sign_bits	=	{sign4[5],sign3[5],sign2[5],sign1[5]};
    
    
    
    wire [3:0] sign_bits1;
    assign  sign_bits1  =   sign_bits;
    reg [59:0]  coefX1;
    always@(*)
	begin
		case(sign_bits1)
			 4'b1111: coefX1 = 60'b1000001011101_111111111111101111_10000000000000000000000001110;
			 4'b1110: coefX1 = 60'b1000100000101_111111111101001100_10000000000000000010100011001;
			 4'b1100: coefX1 = 60'b1000110100001_111111111000100101_10000000000000001011010011101;
			 4'b1000: coefX1 = 60'b1001000111100_111111110001101000_10000000000000011111010011111;
			 4'b0000: coefX1 = 60'b1001010001110_111111101100110111_10000000000000110001000001100;
			 default: coefX1 = 60'b0;
		endcase
	end

    wire [2:0] sign_bits2;
    assign  sign_bits2  =   sign_bits[2:0];
    reg [59:0]  coefX2;
    always@(*)
	begin
		case(sign_bits2)
			 3'b111: coefX2 = 60'b1001011011101_111100010101100011_10000111110000111011011010111;
			 3'b110: coefX2 = 60'b1001101100011_111100010011011110_10000111110000111101100001011;
			 3'b100: coefX2 = 60'b1001111100000_111100001111100100_10000111110001000101011000010;
			 3'b000: coefX2 = 60'b1010001010101_111100001010000110_10000111110001010101110010010;
			 default: coefX2 = 60'b0;
		endcase
	end

    wire [2:0] sign_bits3;
    assign  sign_bits3  =   sign_bits[2:0];
    reg [59:0]  coefX3;
    always@(*)
	begin
		case(sign_bits3)
			 3'b111: coefX3 = 60'b1010011001010_111001001111011000_10001111000110111011110101000;
			 3'b110: coefX3 = 60'b1010100111101_111001001101010111_10001111000110111110001000100;
			 3'b100: coefX3 = 60'b1010110101001_111001001001100101_10001111000111000110101001011;
			 3'b000: coefX3 = 60'b1010111111000_111001000101100001_10001111000111010100000010011;
			 default: coefX3 = 60'b0;
		endcase
	end

    wire [2:0] sign_bits4;
    assign  sign_bits4  =   sign_bits[2:0];
    reg [59:0]  coefX4;
    always@(*)
	begin
		case(sign_bits4)
			 3'b111: coefX4 = 60'b1011001001000_110110100100111001_10010110000101111110001101001;
			 3'b110: coefX4 = 60'b1011010100011_110110100011001100_10010110000110000000010011001;
			 3'b100: coefX4 = 60'b1011011111010_110110100000000110_10010110000110000111011000111;
			 3'b000: coefX4 = 60'b1011100111001_110110011100110010_10010110000110010010100010011;
			 default: coefX4 = 60'b0;
		endcase
	end

    wire [1:0] sign_bits5;
    assign  sign_bits5  =   sign_bits[1:0];
    reg [59:0]  coefX5;
    always@(*)
	begin
		case(sign_bits5)
			 2'b11: coefX5 = 60'b1011101111001_110100010000001100_10011100110001000111000100001;
			 2'b10: coefX5 = 60'b1011111001111_110100001110011001_10011100110001001001100000000;
			 2'b00: coefX5 = 60'b1100000011111_110100001011000101_10011100110001010010010011001;
			 default: coefX5 = 60'b0;
		endcase
	end

    wire [1:0] sign_bits6;
    assign  sign_bits6  =   sign_bits[1:0];
    reg [59:0]  coefX6;
    always@(*)
	begin
		case(sign_bits6)
			 2'b11: coefX6 = 60'b1100001101101_110010001101000001_10100011001010110010101101010;
			 2'b10: coefX6 = 60'b1100010110111_110010001011011100_10100011001010110100111001010;
			 2'b00: coefX6 = 60'b1100011111001_110010001000101000_10100011001010111100100101001;
			 default: coefX6 = 60'b0;
		endcase
	end

    wire [1:0] sign_bits7;
    assign  sign_bits7  =   sign_bits[1:0];
    reg [59:0]  coefX7;
    always@(*)
	begin
		case(sign_bits7)
			 2'b11: coefX7 = 60'b1100100111001_110000011000001001_10101001010100111111110110100;
			 2'b10: coefX7 = 60'b1100101111001_110000010110101011_10101001010101000010000100001;
			 2'b00: coefX7 = 60'b1100110101110_110000010100010110_10101001010101001000101001100;
			 default: coefX7 = 60'b0;
		endcase
	end

    wire [1:0] sign_bits8;
    assign  sign_bits8  =   sign_bits[1:0];
    reg [59:0]  coefX8;
    always@(*)
	begin
		case(sign_bits8)
			 2'b11: coefX8 = 60'b1100111100101_101110101111001001_10101111010001010110111100000;
			 2'b10: coefX8 = 60'b1101000011111_101110101101101100_10101111010001011001010011010;
			 2'b00: coefX8 = 60'b1101001001001_101110101011101110_10101111010001011111001101001;
			 default: coefX8 = 60'b0;
		endcase
	end



    
   reg [59:0]  coefX;
   always@(*)
	begin
		case(x[22:20]) 
              3'b000: begin  
                     
                     coefX = coefX1;
                         
              end
              3'b001: begin  
                     
                      coefX = coefX2;
                         
              end
              3'b010: begin  
                     
                      coefX = coefX3;
                         
              end
               3'b011: begin  
                     
                      coefX = coefX4;
                         
              end
              3'b100: begin  
                     
                      coefX = coefX5;
                         
              end
              3'b101: begin  
                     
                      coefX = coefX6;
                         
              end  
              3'b110: begin  
                     
                      coefX = coefX7;
                         
              end
              3'b111: begin  
                     
                      coefX = coefX8;
                         
              end
              
        endcase 
    end          
    
	
	assign	a	=	coefX[59:47]	;
	assign	b	=	coefX[46:29]	;
	assign	c	=	coefX[28:0]	    ;

	
endmodule

