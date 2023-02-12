module digit(
input [8:0]B, input clk,
output [0:6] segments, output [3:0] enabler, output reg dot);

wire [3:0]n1dig1;
wire [3:0]n1dig0; 
wire [3:0]n2dig1; 
wire [3:0]n2dig0;
//clockDivider #(250000)CD (clk, rst, clk_out);
//initial n1dig1 = 3'b000;
//initial n1dig0 = 3'b000;
//initial n2dig1 = 3'b000;
//initial n2dig0 = 3'b000;

Adding A1 (B[3:0], n1dig1,n1dig0,n2dig1,n2dig0);
wire [1:0]x;
reg [3:0]num;
wire  [13:0] result;
//wire [3:0] Yn1dig1, Yn1dig0, Yn2dig1, Yn2dig0;
//wire out;
clockDivider #(250000)CD (clk, 0, clk_out);
add #(2, 4) AA1 (clk_out, x);

//add a1 ( B[0], n1dig0);
//add a2 ( B[1], n1dig1);
//add a3 ( B[2], n2dig0);
//add a4 ( B[3], n2dig1);

//always @(posedge B[0]) begin
//    if (n1dig0 == 9)
//        n1dig0 <= 0;
//    else 
//        n1dig0 <= n1dig0 + 1;
//end
//always @(posedge B[1]) begin
//    if (n1dig1 == 9)
//        n1dig1 <= 0;
//    else 
//        n1dig1 <= n1dig1 + 1; // non-blocking assignment
//// normal operation
//end
//always @(posedge B[2]) begin
//    if (n2dig0 == 9)
//        n2dig0 <= 0;
//    else 
//        n2dig0 <= n2dig0 + 1;
//end     
//always @(posedge B[3]) begin
//    if (n2dig1 == 9)
//        n2dig1 <= 0;
//    else 
//        n2dig1 <= n2dig1 + 1;
        
//end
reg [1:0] en;   
SevenSeg S0 (num, x, segments, enabler);
Calculate C1(en, n1dig1, n1dig0,n2dig1, n2dig0, result);

//always@ (posedge B[0],  B[1],  B[2],  B[3],  B[4]) begin

//case (x)
//2'b00 : num = n1dig0;
//2'b01 : num = n1dig1;
//2'b10 : num = n2dig0;
//2'b11 : num = n2dig1;
//default : num = 3'b101;
//endcase
//end


//always@ (posedge B[5], B[6], B[7], B[8]) begin
//en = 2'b00;
//case (x)
//2'b00 : num = result[3:0];
//2'b01 : num = result[7:4];
//2'b10 : num = result[11:8];
//2'b11 : num = result[13:12];
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[5]) begin
//en = 2'b00;
//case (x)
//2'b00 : num = result[3:0];
//2'b01 : num = result[7:4];
//2'b10 : num = result[11:8];
//2'b11 : num = result[13:12];
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[6]) begin
//en = 2'b01;
//case (x)
//2'b00 : num = result[3:0];
//2'b01 : num = result[7:4];
//2'b10 : num = result[11:8];
//2'b11 : num = result[13:12];
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[7]) begin
//en = 2'b10;
//case (x)
//2'b00 : num = result[3:0];
//2'b01 : num = result[7:4];
//2'b10 : num = result[11:8];
//2'b11 : num = result[13:12];
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[8]) begin
//en = 2'b11;
//case (x)
//2'b00 : num = result[3:0];
//2'b01 : num = result[7:4];
//2'b10 : num = result[11:8];
//2'b11 : num = result[13:12];
//default : num = 3'b101;
//endcase
//end

always@ (B) begin
//always@ (posedge B[5],posedge B[6],posedge B[7],posedge B[8]) begin
if (B[5]) en = 2'b00;
if (B[6]) en = 2'b01;
if (B[7]) en = 2'b10;
if (B[8]) en = 2'b11;
end
always@ (* ) begin
if (B[5] || B[6] || B[7] || B[8])
    case (x)
    2'b00 : num = result%10;
    2'b01 : num = (result/10) %10;
    2'b10 : num = (result/100) %10;
    2'b11 : num = (result/1000) %10;
    endcase
    
else
    case (x)
    2'b00 : begin num = n1dig0; dot = 1;end
    2'b01 : begin num = n1dig1; dot = 1; end
    2'b10 : begin num = n2dig0; dot = 0; end
    2'b11 : begin num = n2dig1; dot = 1;end
   
    endcase    
end

//always@ (posedge B[8:5]) begin
////always@ (posedge B[5],posedge B[6],posedge B[7],posedge B[8]) begin
//if (B[5]) en = 2'b00;
//if (B[6]) en = 2'b01;
//if (B[7]) en = 2'b10;
//if (B[8]) en = 2'b11;

//case (x)
//2'b00 : num = result[3:0];
//2'b01 : num = result[7:4];
//2'b10 : num = result[11:8];
//2'b11 : num = result[13:12];
//default : num = 3'b101;
//endcase
//end
////always@ (posedge B[0], B[1], B[2], B[3], B[9]) begin

////always@ (posedge B[0],posedge B[1],posedge B[2],posedge B[3],posedge B[4] ) begin
//always@ (posedge B[4:0] ) begin

//case (x)
//2'b00 : num = n1dig0;
//2'b01 : num = n1dig1;
//2'b10 : num = n2dig0;
//2'b11 : num = n2dig1;
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[0]) begin

//case (x)
//2'b00 : num = n1dig0;
//2'b01 : num = n1dig1;
//2'b10 : num = n2dig0;
//2'b11 : num = n2dig1;
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[1]) begin

//case (x)
//2'b00 : num = n1dig0;
//2'b01 : num = n1dig1;
//2'b10 : num = n2dig0;
//2'b11 : num = n2dig1;
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[2]) begin

//case (x)
//2'b00 : num = n1dig0;
//2'b01 : num = n1dig1;
//2'b10 : num = n2dig0;
//2'b11 : num = n2dig1;
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[3]) begin

//case (x)
//2'b00 : num = n1dig0;
//2'b01 : num = n1dig1;
//2'b10 : num = n2dig0;
//2'b11 : num = n2dig1;
//default : num = 3'b101;
//endcase
//end

//always@ (posedge B[4]) begin

//case (x)
//2'b00 : num = n1dig0;
//2'b01 : num = n1dig1;
//2'b10 : num = n2dig0;
//2'b11 : num = n2dig1;
//default : num = 3'b101;
//endcase
//end

endmodule