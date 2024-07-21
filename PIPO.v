`timescale 1ns / 1ps

module PIPO(a,clock,load,reg_out);

parameter n = 3;

input [3:0] a;
input clock;
input load;
output reg [n:0] reg_out;

always @(posedge clock)
begin
    if(load)
    reg_out <= a;
end
endmodule
