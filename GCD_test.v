`timescale 1ns / 1ps

module GCD_test();

reg [3:0] a_data,b_data;
reg reset;
reg clock = 1'b1;
wire [3:0] d_out;

GCD_UNIFIED_HW UUT(a_data,b_data,reset,clock,d_out);

always 
#5 clock = ~clock; 

initial 

begin
reset <= 1;
#10
reset <= 0 ;
//a_data <= 4'b1111;
//b_data <= 4'b1101;
//a_data <= 4'b1101;
//b_data <= 4'b1111;
//a_data <= 4'b0110;
//b_data <= 4'b0011;
a_data <= 4'b1111;
b_data <= 4'b1101;

end

endmodule
