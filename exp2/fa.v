`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 17:08:38
// Design Name: 
// Module Name: fa
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

// a + b + ci = s + 2* co
module fa(
    input a,
    input b,
    input ci,
    output co,
    output s
    );

  assign s  = a ^ b ^ ci;
  assign co = (a & b) | (a & ci) | (b & ci);
	
	
endmodule