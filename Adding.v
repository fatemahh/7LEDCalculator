`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2022 02:39:07 PM
// Design Name: 
// Module Name: Adding
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


module Adding( input [3:0] but, 
output [3:0]n1dig1, [3:0]n1dig0, [3:0]n2dig1, [3:0]n2dig0);

 
add a1 ( but[0], n1dig0);
add a2 ( but[1], n1dig1);
add a3 ( but[2], n2dig0);
add a4 ( but[3], n2dig1);
endmodule
