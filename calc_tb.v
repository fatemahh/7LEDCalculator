`timescale 1ns / 1ps

module calc_tb();
    reg [1:0] en;
    reg [3:0] n1dig1, n1dig0, n2dig1, n2dig0;
    wire [13:0] num;
   
    Calculate UUT( en, n1dig1, n1dig0, n2dig1, n2dig0, num);
    
    initial begin
        en = 2'b0; //19 + 29
        n1dig1 = 4'b0001; n1dig0 = 4'b1001;
        n2dig1 = 4'b0010; n2dig0 = 4'b1001;
    end
endmodule
