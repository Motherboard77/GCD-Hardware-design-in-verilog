`timescale 1ns / 1ps

module GCD_datapath(a_data,b_data,enable,sel,a_load,b_load,a_sel,b_sel,d_load,
clock,d_out,x_eq_y,x_greater_y);

input [3:0] a_data;
input [3:0] b_data;
input enable;
input [1:0] sel;
input a_load, b_load;
input a_sel,b_sel;
input d_load;
input clock;

output [3:0] d_out;
output x_eq_y;
output x_greater_y;

wire [3:0] ALU_out;
wire [3:0] muxa_out,muxb_out;
wire [3:0] rega_out,regb_out;
wire [3:0] a_minus_b,b_minus_a;
wire [3:0] x_nt_y,x_gt_y;

PIPO REGA(muxa_out,clock,a_load,rega_out);
PIPO REGB(muxb_out,clock,b_load,regb_out);
PIPO REGD(rega_out,clock,d_load,d_out);

MUX_4bit MUXA(a_data,a_minus_b,a_sel,muxa_out);
MUX_4bit MUXB(b_data,b_minus_a,b_sel,muxb_out);

ALU PROCESSOR1(rega_out,regb_out,sel,enable,ALU_out);
ALU_demux PROCESSOR_DEMUX(ALU_out,sel,a_minus_b,b_minus_a,x_nt_y,x_gt_y);

and A1(x_eq_y,x_nt_y);
and A2(x_greater_y,x_gt_y);

endmodule
