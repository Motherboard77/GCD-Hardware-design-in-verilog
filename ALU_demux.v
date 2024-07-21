`timescale 1ns / 1ps

module ALU_demux(a,sel,out1,out2,out3,out4);

input [3:0] a;
output reg [3:0] out1;
output reg [3:0] out2;
output reg [3:0] out3;
output reg [3:0] out4;
input [1:0] sel;

always @(*)
begin
   case(sel)
   
   2'b00: out1 <= a;
   2'b01: out2 <= a;
   2'b10: out3 <= a;
   2'b11: out4 <= a;
   
   endcase

end

endmodule
