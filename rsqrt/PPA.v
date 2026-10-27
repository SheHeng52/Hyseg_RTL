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
	output	[9:0]	a,
	
	output	[15:0]	b,
	
	output	[24:0]	c
    );
    

    
    localparam [31:0]  coef_seg1 = 32'b01101001_01001101_00110101_00100000;
    localparam [31:0]  coef_seg2 = 32'b01110110_01010101_00111001_00100100;
    localparam [31:0]  coef_seg3 = 32'b10000000_01100100_01000100_00100101;            
    localparam [31:0]  coef_seg4 = 32'b01111101_01011101_01000100_00101001;  
               
    localparam [31:0]  coef_seg5 = 32'b10000000_01100101_01001101_00101011;    
    localparam [31:0]  coef_seg6 = 32'b10000000_01110110_01011010_00101110;    
    localparam [31:0]  coef_seg7 = 32'b10000000_01110110_01010111_00101110;    
    localparam [31:0]  coef_seg8 = 32'b10000000_10000000_01100100_00110001;
    
    localparam [31:0]  coef_seg9 = 32'b10000000_10000000_01010010_00110101;
    localparam [31:0]  coef_seg10= 32'b10000000_10000000_01101000_00110101;
    localparam [31:0]  coef_seg11= 32'b10000000_01110111_01010001_00101110;            
    localparam [31:0]  coef_seg12= 32'b10000000_01111111_01110001_00110111;  
               
    localparam [31:0]  coef_seg13= 32'b10000000_10000000_01011011_00110001;    
    localparam [31:0]  coef_seg14= 32'b10000000_10000000_01100100_00111000;    
    localparam [31:0]  coef_seg15= 32'b10000000_10000000_01010011_00110100;    
    localparam [31:0]  coef_seg16= 32'b10000000_10000000_01100101_00111100;
    
    
    reg [31:0]  coef_seg;
    
    always@(*)
	begin
		case(x[22:19]) 
              4'b0000: begin  
                     coef_seg = coef_seg1;
              end
              
              4'b0001: begin  
                     coef_seg = coef_seg2;
              end
              
              4'b0010: begin  
                     coef_seg = coef_seg3;
              end
              
              4'b0011: begin  
                     coef_seg = coef_seg4;
              end
              
              4'b0100: begin  
                     coef_seg = coef_seg5;
              end
              
              4'b0101: begin  
                     coef_seg = coef_seg6;
              end
              
              4'b0110: begin  
                     coef_seg = coef_seg7;
              end
              
              4'b0111: begin  
                     coef_seg = coef_seg8;
              end
              
              4'b1000: begin  
                     coef_seg = coef_seg9;
              end
              
              4'b1001: begin  
                     coef_seg = coef_seg10;
              end
              
              4'b1010: begin  
                     coef_seg = coef_seg11;
              end
              
              4'b1011: begin  
                     coef_seg = coef_seg12;
              end
              
              4'b1100: begin  
                     coef_seg = coef_seg13;
              end
              
              4'b1101: begin  
                     coef_seg = coef_seg14;
              end
              
              4'b1110: begin  
                     coef_seg = coef_seg15;
              end
              
              4'b1111: begin  
                     coef_seg = coef_seg16;
              end
              
        endcase 
    end  
    
    
           
    wire [7:0] sign1;
    wire [7:0] sign2;
    wire [7:0] sign3;
    wire [7:0] sign4;
    
    wire [7:0]   coef_seg1_1 ;
    wire [7:0]   coef_seg1_2 ;
    wire [7:0]   coef_seg1_3 ;
    wire [7:0]   coef_seg1_4 ;
    
    assign coef_seg1_1 = coef_seg[7:0];
    assign coef_seg1_2 = coef_seg[15:8];
    assign coef_seg1_3 = coef_seg[23:16];
    assign coef_seg1_4 = coef_seg[31:24];
   
    
    
    assign  sign1 = (x[18:12] - coef_seg1_1);
    assign  sign2 = (x[18:12] - coef_seg1_2);
    assign  sign3 = (x[18:12] - coef_seg1_3);
    assign  sign4 = (x[18:12] - coef_seg1_4);
    
    
    wire [3:0] sign_bits;
    assign	sign_bits	=	{sign4[7],sign3[7],sign2[7],sign1[7]};
    
    wire [3:0] sign_bits1;
    assign  sign_bits1  =   sign_bits;
    reg [50:0]  coefX1;
    always@(*)
	begin
		case(sign_bits1)
			 4'b1111: coefX1 = 51'b1011110001_1000000000000011_1111111111111111111111110;
			 4'b1110: coefX1 = 51'b1011011001_1000000000011001_1111111111111111110101110;
			 4'b1100: coefX1 = 51'b1011000110_1000000000111001_1111111111111111011011001;
			 4'b1000: coefX1 = 51'b1010110001_1000000001101101_1111111111111110011010110;
			 4'b0000: coefX1 = 51'b1010011101_1000000010101110_1111111111111100110000110;
			 default: coefX1 = 51'b0;
		endcase
	end

    wire [3:0] sign_bits2;
    assign  sign_bits2  =   sign_bits;
    reg [50:0]  coefX2;
    always@(*)
	begin
		case(sign_bits2)
			 4'b1111: coefX2 = 51'b1010000111_1000101100100011_1111100001011011010000011;
			 4'b1110: coefX2 = 51'b1001110010_1000101100111000_1111100001011011000101111;
			 4'b1100: coefX2 = 51'b1001100001_1000101101010111_1111100001011010101001111;
			 4'b1000: coefX2 = 51'b1001001101_1000101110001101_1111100001011001100001000;
			 4'b0000: coefX2 = 51'b1000111111_1000101110111110_1111100001011000001011101;
			 default: coefX2 = 51'b0;
		endcase
	end

    wire [2:0] sign_bits3;
    assign  sign_bits3  =   sign_bits[2:0];
    reg [50:0]  coefX3;
    always@(*)
	begin
		case(sign_bits3)
			 3'b111: coefX3 = 51'b1000110001_1001010010111101_1111000101011011111011101;
			 3'b110: coefX3 = 51'b1000011101_1001010011010011_1111000101011011101111011;
			 3'b100: coefX3 = 51'b1000001011_1001010011111001_1111000101011011000111011;
			 3'b000: coefX3 = 51'b0111111011_1001010100101011_1111000101011001111001011;
			 default: coefX3 = 51'b0;
		endcase
	end

    wire [3:0] sign_bits4;
    assign  sign_bits4  =   sign_bits;
    reg [50:0]  coefX4;
    always@(*)
	begin
		case(sign_bits4)
			 4'b1111: coefX4 = 51'b0111101010_1001110100011000_1110101011101011111101010;
			 4'b1110: coefX4 = 51'b0111011001_1001110100101100_1110101011101011110001010;
			 4'b1100: coefX4 = 51'b0111001101_1001110101000101_1110101011101011010111001;
			 4'b1000: coefX4 = 51'b0111000000_1001110101101011_1110101011101010011111101;
			 4'b0000: coefX4 = 51'b0110111000_1001110110001001_1110101011101001100111100;
			 default: coefX4 = 51'b0;
		endcase
	end

    wire [2:0] sign_bits5;
    assign  sign_bits5  =   sign_bits[2:0];
    reg [50:0]  coefX5;
    always@(*)
	begin
		case(sign_bits5)
			 3'b111: coefX5 = 51'b0110101111_1010010001101011_1110010011111001001011100;
			 3'b110: coefX5 = 51'b0110011110_1010010010000001_1110010011111000111101001;
			 3'b100: coefX5 = 51'b0110010100_1010010010011001_1110010011111000100000011;
			 3'b000: coefX5 = 51'b0110001010_1010010010111000_1110010011110111110000100;
			 default: coefX5 = 51'b0;
		endcase
	end

    wire [2:0] sign_bits6;
    assign  sign_bits6  =   sign_bits[2:0];
    reg [50:0]  coefX6;
    always@(*)
	begin
		case(sign_bits6)
			 3'b111: coefX6 = 51'b0101111101_1010101011100010_1101111101110100100000100;
			 3'b110: coefX6 = 51'b0101101101_1010101011111001_1101111101110100001111101;
			 3'b100: coefX6 = 51'b0101100010_1010101100010111_1101111101110011100110111;
			 3'b000: coefX6 = 51'b0101011100_1010101100101101_1101111101110010111110100;
			 default: coefX6 = 51'b0;
		endcase
	end

    wire [2:0] sign_bits7;
    assign  sign_bits7  =   sign_bits[2:0];
    reg [50:0]  coefX7;
    always@(*)
	begin
		case(sign_bits7)
			 3'b111: coefX7 = 51'b0101010100_1011000010011110_1101101001010001010010100;
			 3'b110: coefX7 = 51'b0101000111_1011000010110000_1101101001010001000101101;
			 3'b100: coefX7 = 51'b0100111101_1011000011001010_1101101001010000100011110;
			 3'b000: coefX7 = 51'b0100110111_1011000011011111_1101101001001111111111010;
			 default: coefX7 = 51'b0;
		endcase
	end

    wire [1:0] sign_bits8;
    assign  sign_bits8  =   sign_bits[1:0];
    reg [50:0]  coefX8;
    always@(*)
	begin
		case(sign_bits8)
			 2'b11: coefX8 = 51'b0100110000_1011010110111101_1101010110000100110011011;
			 2'b10: coefX8 = 51'b0100100011_1011010111010001_1101010110000100100011101;
			 2'b00: coefX8 = 51'b0100011010_1011010111101100_1101010110000011111010111;
			 default: coefX8 = 51'b0;
		endcase
	end

    wire [1:0] sign_bits9;
    assign  sign_bits9  =   sign_bits[1:0];
    reg [50:0]  coefX9;
    always@(*)
	begin
		case(sign_bits9)
			 2'b11: coefX9 = 51'b0100010001_1011101001010101_1101000100000101111010110;
			 2'b10: coefX9 = 51'b0100001000_1011101001100010_1101000100000101110001100;
			 2'b00: coefX9 = 51'b0100000000_1011101001111000_1101000100000101010011011;
			 default: coefX9 = 51'b0;
		endcase
	end

    wire [1:0] sign_bits10;
    assign  sign_bits10  =   sign_bits[1:0];
    reg [50:0]  coefX10;
    always@(*)
	begin
		case(sign_bits10)
			 2'b11: coefX10 = 51'b0011110111_1011111001111000_1100110011001100110011001;
			 2'b10: coefX10 = 51'b0011101101_1011111010001000_1100110011001100100101111;
			 2'b00: coefX10 = 51'b0011100110_1011111010011101_1100110011001100000110101;
			 default: coefX10 = 51'b0;
		endcase
	end

    wire [2:0] sign_bits11;
    assign  sign_bits11  =   sign_bits[2:0];
    reg [50:0]  coefX11;
    always@(*)
	begin
		case(sign_bits11)
			 3'b111: coefX11 = 51'b0011100001_1100001000110110_1100100011010010101010101;
			 3'b110: coefX11 = 51'b0011011010_1100001000111111_1100100011010010100100100;
			 3'b100: coefX11 = 51'b0011010100_1100001001001110_1100100011010010010001011;
			 3'b000: coefX11 = 51'b0011010000_1100001001011011_1100100011010001111100101;
			 default: coefX11 = 51'b0;
		endcase
	end

    wire [2:0] sign_bits12;
    assign  sign_bits12  =   sign_bits[2:0];
    reg [50:0]  coefX12;
    always@(*)
	begin
		case(sign_bits12)
			 3'b111: coefX12 = 51'b0011001100_1100010110011101_1100010100010001101000100;
			 3'b110: coefX12 = 51'b0011000100_1100010110101010_1100010100010001011101100;
			 3'b100: coefX12 = 51'b0010111111_1100010110111010_1100010100010001000011111;
			 3'b000: coefX12 = 51'b0010111110_1100010110111110_1100010100010000111011110;
			 default: coefX12 = 51'b0;
		endcase
	end

    wire [1:0] sign_bits13;
    assign  sign_bits13  =   sign_bits[1:0];
    reg [50:0]  coefX13;
    always@(*)
	begin
		case(sign_bits13)
			 2'b11: coefX13 = 51'b0010111011_1100100010110110_1100000110000100100011110;
			 2'b10: coefX13 = 51'b0010110101_1100100010111110_1100000110000100011110100;
			 2'b00: coefX13 = 51'b0010110000_1100100011001100_1100000110000100001010111;
			 default: coefX13 = 51'b0;
		endcase
	end

    wire [1:0] sign_bits14;
    assign  sign_bits14  =   sign_bits[1:0];
    reg [50:0]  coefX14;
    always@(*)
	begin
		case(sign_bits14)
			 2'b11: coefX14 = 51'b0010101011_1100101110001100_1011111000100110111010101;
			 2'b10: coefX14 = 51'b0010100101_1100101110010101_1011111000100110110100000;
			 2'b00: coefX14 = 51'b0010100001_1100101110100001_1011111000100110100010011;
			 default: coefX14 = 51'b0;
		endcase
	end

    wire [1:0] sign_bits15;
    assign  sign_bits15  =   sign_bits[1:0];
    reg [50:0]  coefX15;
    always@(*)
	begin
		case(sign_bits15)
			 2'b11: coefX15 = 51'b0010011101_1100111000100110_1011101011110100101110011;
			 2'b10: coefX15 = 51'b0010011001_1100111000101100_1011101011110100101001100;
			 2'b00: coefX15 = 51'b0010010101_1100111000110110_1011101011110100011100111;
			 default: coefX15 = 51'b0;
		endcase
	end

    wire [1:0] sign_bits16;
    assign  sign_bits16  =   sign_bits[1:0];
    reg [50:0]  coefX16;
    always@(*)
	begin
		case(sign_bits16)
			 2'b11: coefX16 = 51'b0010010000_1101000010001011_1011011111101010011100110;
			 2'b10: coefX16 = 51'b0010001100_1101000010010010_1011011111101010010110011;
			 2'b00: coefX16 = 51'b0010001001_1101000010011011_1011011111101010001000111;
			 default: coefX16 = 51'b0;
		endcase
	end

    
    
   reg [50:0]  coefX;
   always@(*)
	begin
		case(x[22:19]) 
              4'b0000: begin  
                     
                     coefX = coefX1;
                         
              end
              4'b0001: begin  
                     
                      coefX = coefX2;
                         
              end
              4'b0010: begin  
                     
                     coefX = coefX3;
                         
              end
              4'b0011: begin  
                     
                      coefX = coefX4;
                         
              end
              4'b0100: begin  
                     
                     coefX = coefX5;
                         
              end
              4'b0101: begin  
                     
                      coefX = coefX6;
                         
              end
              4'b0110: begin  
                     
                     coefX = coefX7;
                         
              end
              4'b0111: begin  
                     
                      coefX = coefX8;
                         
              end
              4'b1000: begin  
                     
                     coefX = coefX9;
                         
              end
              4'b1001: begin  
                     
                      coefX = coefX10;
                         
              end
              4'b1010: begin  
                     
                     coefX = coefX11;
                         
              end
              4'b1011: begin  
                     
                      coefX = coefX12;
                         
              end
              4'b1100: begin  
                     
                     coefX = coefX13;
                         
              end
              4'b1101: begin  
                     
                      coefX = coefX14;
                         
              end
              4'b1110: begin  
                     
                     coefX = coefX15;
                         
              end
              4'b1111: begin  
                     
                      coefX = coefX16;
                         
              end
        endcase 
    end          
    
	

	assign	a	=	coefX[50:41]	;
	assign	b	=	coefX[40:25]	;
	assign	c	=	coefX[24:0]	;

	

endmodule


