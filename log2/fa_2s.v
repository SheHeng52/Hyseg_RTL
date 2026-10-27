`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 17:08:38
// Design Name: 
// Module Name: fa_2s
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


module fa_2s (
    input  wire a,
    input  wire b,
    input  wire c,
    output wire cc,
    output wire s
);

assign s  = a ^ b ^ c;
assign cc = (a & b) | (a & ~c) | (b & ~c);

endmodule
