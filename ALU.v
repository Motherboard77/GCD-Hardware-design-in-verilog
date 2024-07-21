`timescale 1ns / 1ps

module ALU(a,b,sel,enable,out);

input [3:0] a,b;
input enable;
input [1:0] sel;
output [3:0]out;
reg [3:0] out_temp;

assign out = out_temp;

always @(*)
begin
    if(enable)
    begin
        case(sel)
    
        2'b00: out_temp <= a - b;
        2'b01: out_temp <= b - a;
        2'b10: out_temp <= (a==b)?4'b1: 4'b0;
        2'b11: out_temp <= (a>b)?4'b1: 4'b0;
    
        endcase
     end
//     else
//            out_temp = 4'b0;
   
end
endmodule
