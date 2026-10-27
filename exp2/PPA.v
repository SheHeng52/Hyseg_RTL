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
	output	[14:0]	a,
	
	output	[20:0]	b,
	
	output	[25:0]	c
    );
    

    
    localparam [34:0]  coef_seg1 = 35'b1000000_0111101_0101111_0100000_0010000;
    localparam [34:0]  coef_seg2 = 35'b1000000_0111011_0101101_0011110_0001111;
    localparam [34:0]  coef_seg3 = 35'b1000000_0111010_0101011_0011101_0001111;            
    localparam [34:0]  coef_seg4 = 35'b1000000_0110111_0101010_0011100_0001110;            
    localparam [34:0]  coef_seg5 = 35'b1000000_0110101_0100111_0011010_0001101;    
    localparam [34:0]  coef_seg6 = 35'b1000000_0110011_0100111_0011010_0001110;    
    localparam [34:0]  coef_seg7 = 35'b1000000_0110011_0100110_0011001_0001101;    
    localparam [34:0]  coef_seg8 = 35'b0111111_0110011_0100111_0011010_0001101;
    reg [34:0]  coef_seg;
    
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
    wire [6:0] sign1;
    wire [6:0] sign2;
    wire [6:0] sign3;
    wire [6:0] sign4;
    wire [6:0] sign5;
    
    
    wire [6:0]   coef_seg1_1 ;
    wire [6:0]   coef_seg1_2 ;
    wire [6:0]   coef_seg1_3 ;
    wire [6:0]   coef_seg1_4 ;
    wire [6:0]   coef_seg1_5 ;
    
    
    assign coef_seg1_1 = coef_seg[6:0];
    assign coef_seg1_2 = coef_seg[13:7];
    assign coef_seg1_3 = coef_seg[20:14];
    assign coef_seg1_4 = coef_seg[27:21];
    assign coef_seg1_5 = coef_seg[34:28];
    
    
    assign  sign1 = (x[19:14] - coef_seg1_1);
    assign  sign2 = (x[19:14] - coef_seg1_2);
    assign  sign3 = (x[19:14] - coef_seg1_3);
    assign  sign4 = (x[19:14] - coef_seg1_4);
    assign  sign5 = (x[19:14] - coef_seg1_5);
    
    
    wire [4:0] sign_bits;
    assign	sign_bits	=	{sign5[6],sign4[6],sign3[6],sign2[6],sign1[6]};
    
    
    wire [3:0] sign_bits1;
    assign  sign_bits1  =   sign_bits[3:0];
    reg [61:0]  coefX1;
    always@(*)
	begin
		case(sign_bits1)
			 4'b1111: coefX1 = 62'b011111000101011_010110001011100000001_10000000000000000000000010;
			 4'b1110: coefX1 = 62'b011111110001000_010110001010110100100_10000000000000000010110100;
			 4'b1100: coefX1 = 62'b100000011100001_010110001001011110101_10000000000000001101100011;
			 4'b1000: coefX1 = 62'b100001000101010_010110000111100110010_10000000000000100011100111;
			 4'b0000: coefX1 = 62'b100001011101101_010110000110001100010_10000000000000111000010111;
			 default: coefX1 = 62'b0;
		endcase
	end

    wire [3:0] sign_bits2;
    assign  sign_bits2  =   sign_bits[3:0];
    reg [61:0]  coefX2;
    always@(*)
	begin
		case(sign_bits2)
			 4'b1111: coefX2 = 62'b100001111000001_011000001011111111001_10001011100101011100001001;
			 4'b1110: coefX2 = 62'b100010100100100_011000001011010101011_10001011100101011110101001;
			 4'b1100: coefX2 = 62'b100011010001111_011000001010000000001_10001011100101101000101101;
			 4'b1000: coefX2 = 62'b100011111110101_011000001000000010110_10001011100101111110101101;
			 4'b0000: coefX2 = 62'b100100011100011_011000000110011000001_10001011100110010110100101;
			 default: coefX2 = 62'b0;
		endcase
	end

    wire [3:0] sign_bits3;
    assign  sign_bits3  =   sign_bits[3:0];
    reg [61:0]  coefX3;
    always@(*)
	begin
		case(sign_bits3)
			 4'b1111: coefX3 = 62'b100100111100001_011010011000000101111_10011000001101111111000011;
			 4'b1110: coefX3 = 62'b100101101011001_011010010111011010011_10011000001110000001100111;
			 4'b1100: coefX3 = 62'b100110011001010_011010010110000110101_10011000001110001011001010;
			 4'b1000: coefX3 = 62'b100111001001111_011010010100000011010_10011000001110100001011001;
			 4'b0000: coefX3 = 62'b100111101101110_011010010010000101000_10011000001110111101001011;
			 default: coefX3 = 62'b0;
		endcase
	end

    wire [3:0] sign_bits4;
    assign  sign_bits4  =   sign_bits[3:0];
    reg [61:0]  coefX4;
    always@(*)
	begin
		case(sign_bits4)
			 4'b1111: coefX4 = 62'b101000010000100_011100110000111000110_10100101111111101101011100;
			 4'b1110: coefX4 = 62'b101001000001110_011100110000001101100_10100101111111101111110111;
			 4'b1100: coefX4 = 62'b101001110100000_011100101110110101100_10100101111111111001100010;
			 4'b1000: coefX4 = 62'b101010100101010_011100101100110100101_10100110000000001110101010;
			 4'b0000: coefX4 = 62'b101011001110001_011100101010101010000_10100110000000101100000100;
			 default: coefX4 = 62'b0;
		endcase
	end

    wire [3:0] sign_bits5;
    assign  sign_bits5  =   sign_bits[3:0];
    reg [61:0]  coefX5;
    always@(*)
	begin
		case(sign_bits5)
			 4'b1111: coefX5 = 62'b101011110111111_011111010111100000101_10110101000001001111001110;
			 4'b1110: coefX5 = 62'b101100101001100_011111010110111000001_10110101000001010001010101;
			 4'b1100: coefX5 = 62'b101101011100010_011111010101100101101_10110101000001011001110000;
			 4'b1000: coefX5 = 62'b101110010001111_011111010011100010010_10110101000001101101111011;
			 4'b0000: coefX5 = 62'b101111000100100_011111010000111100011_10110101000010001111111011;
			 default: coefX5 = 62'b0;
		endcase
	end

    wire [3:0] sign_bits6;
    assign  sign_bits6  =   sign_bits[3:0];
    reg [61:0]  coefX6;
    always@(*)
	begin
		case(sign_bits6)
			 4'b1111: coefX6 = 62'b101111110111111_100010001101001100100_11000101011001110010101010;
			 4'b1110: coefX6 = 62'b110000101110010_100010001100011110001_11000101011001110101001011;
			 4'b1100: coefX6 = 62'b110001100011100_100010001011000111000_11000101011001111110001000;
			 4'b1000: coefX6 = 62'b110010011001101_100010001001000011101_11000101011010010010000110;
			 4'b0000: coefX6 = 62'b110011010000110_100010000110010011010_11000101011010110101011010;
			 default: coefX6 = 62'b0;
		endcase
	end

    wire [3:0] sign_bits7;
    assign  sign_bits7  =   sign_bits[3:0];
    reg [61:0]  coefX7;
    always@(*)
	begin
		case(sign_bits7)
			 4'b1111: coefX7 = 62'b110100001010110_100101010011010110001_11010111010001001111110101;
			 4'b1110: coefX7 = 62'b110101000100000_100101010010101000011_11010111010001010010001010;
			 4'b1100: coefX7 = 62'b110101111101111_100101010001001101001_11010111010001011011001100;
			 4'b1000: coefX7 = 62'b110110111011010_100101001110111011010_11010111010001110000111010;
			 4'b0000: coefX7 = 62'b110111111001101_100101001011110100011_11010111010010011000100110;
			 default: coefX7 = 62'b0;
		endcase
	end

    wire [4:0] sign_bits8;
    assign  sign_bits8  =   sign_bits;
    reg [61:0]  coefX8;
    always@(*)
	begin
		case(sign_bits8)
			 5'b11111: coefX8 = 62'b111000111001001_101000101011011010111_11101010110000001100011101;
			 5'b11110: coefX8 = 62'b111001111001111_101000101010100110001_11101010110000001111001100;
			 5'b11100: coefX8 = 62'b111010111011101_101000101000111011001_11101010110000011010001000;
			 5'b11000: coefX8 = 62'b111011111100000_101000100110011110111_11101010110000110001111000;
			 5'b10000: coefX8 = 62'b111100111010110_101000100011010110110_11101010110001011001110100;
			 5'b00000: coefX8 = 62'b111101011101010_101000100001010011100_11101010110001111001000000;
			 default: coefX8 = 62'b0;
		endcase
	end


    
   reg [61:0]  coefX;
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
    
	
	assign	a	=	coefX[61:47]	;
	assign	b	=	coefX[46:26]	;
	assign	c	=	coefX[25:0]	    ;

	
endmodule

