`timescale 1ns / 1ps

module MUX_4bit(a,b,sel,mux_out);

parameter n = 3;

input [n:0] a,b;
input sel;
output [n:0] mux_out;

assign mux_out = sel ? b: a;  //sel = 1, output = b, else output = a

endmodule
