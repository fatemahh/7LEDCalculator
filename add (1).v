`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 01:59:35 PM
// Design Name: 
// Module Name: add
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


module add #(parameter x= 4, n = 10)
(input adder, output reg [x-1:0]count);
//reg [x-1:0] count;

always @(posedge adder) begin
    if (count == n-1)
        count <= 0;
    else 
        count <= count + 1; // non-blocking assignment
// normal operation
end
endmodule
