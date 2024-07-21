`timescale 1ns / 1ps

module GCD_UNIFIED_HW(a_data,b_data,reset,clock,d_out);

input [3:0] a_data;
input [3:0] b_data;
input reset;
input clock;
output [3:0] d_out;

wire enable;
wire [3:0] select;
wire a_load,b_load;
wire a_sel,b_sel;
wire d_load;
wire x_eq_y,x_greater_y;

GCD_datapath DATAPATH(a_data,b_data,enable,select,a_load,b_load,a_sel,
b_sel,d_load,clock,d_out,x_eq_y,x_greater_y);

CONTROLLER CONTROL(x_eq_y,x_greater_y,reset,clock,enable,select,
a_sel,b_sel,a_load,b_load,d_load);

endmodule
