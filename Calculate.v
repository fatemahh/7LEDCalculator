`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2022 03:23:33 PM
// Design Name: 
// Module Name: Calculate
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


module Calculate(
input [1:0] en, [3:0]n1dig1, [3:0]n1dig0, [3:0]n2dig1, [3:0]n2dig0, output reg [13:0]num);
    wire [6:0] n1, n2;
    assign n1 = n1dig1 * 10 + n1dig0;//{n1dig1,n1dig0};
    assign n2 =  n2dig1 * 10 + n2dig0; //{n2dig1,n2dig0};
always@ (*) begin
//if (en == 1) 
//num = {n2dig1,n2dig0}- {n1dig1,n1dig0} ;
//if (en == 2) 
//num = {n2dig1,n2dig0}*{n1dig1,n1dig0} ;
//if (en == 3) 
//num = {n2dig1,n2dig0}/ {n1dig1,n1dig0} ;
//end

    case (en)
    2'b00 : num = n2 + n1 ;
    2'b01 : num = n2  - n1;
    2'b10 : num = n2  * n1;
    2'b11 : num = n2 /  n1 ;
    endcase
    end
endmodule
