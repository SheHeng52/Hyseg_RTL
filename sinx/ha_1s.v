`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 17:08:38
// Design Name: 
// Module Name: ha_1s
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


module ha_1s(
    input a,
    input b,
    output co,
    output s
    );
	
	assign s  = a ^ b;
	assign co = a | b;

	
	
endmodule
