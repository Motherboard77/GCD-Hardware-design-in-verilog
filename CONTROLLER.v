`timescale 1ns / 1ps

module CONTROLLER(x_eq_y,x_greater_y,reset,clock,enable,sel,a_sel,b_sel,a_load,
b_load,d_load);

input reset;
input x_eq_y;
input x_greater_y;
input clock;

output reg enable;
output reg [1:0] sel;
output reg a_sel,b_sel;
output reg a_load,b_load;
output reg d_load;

reg [3:0] state;
parameter S0 = 4'b0000,
          S1 = 4'b0001,
          S2 = 4'b0010,
          S3 = 4'b0011,
          S4 = 4'b0100,
          S5 = 4'b0101,
          S6 = 4'b0110,
          S7 = 4'b0111,
          S8 = 4'b1000,
          S9 = 4'b1001;
          
always @(posedge clock )  //or  posedge reset
begin
      case (state)
      
      S0: begin
            if(reset)
            begin
                $display("State 0");
                enable <= 0;
                state <= S0;end
            else
                $display("State 0");
                state <= S1;
          end
      S1: begin
          $display("State 1");
          a_sel <= 0; b_sel<=0; a_load<=1; b_load<=1;
          state <= S2;
          end
      S2: begin 
          $display("State 2");
          enable <= 1;
          state <= S3;
          end
      S3: begin
          $display("State 3");
          sel <= 2'b10;
          state <= S4;
          end
      S4: begin
          if(x_eq_y)begin        //probematic statement
          $display("State 4");
          state <= S9;end
          else
          begin
          $display("State 4");
          sel <= 2'b11;
          state <= S5;end
          end
      S5: begin
          if(x_greater_y)
          begin
          state = S6;$display("State 5");end
          else
          begin
          state = S7;$display("State 5");end
          end
      S6: begin   //x = x-y
          sel = 2'b00;
          a_sel =1;
          state = S8;
          $display("State 6");
          end
      S7: begin   //y = y-x
          sel = 2'b01;
          b_sel =1;
          state = S8;
          $display("State 7");
          end
      S8: begin
          state = S3; 
          $display("State 8");
          end
      S9: begin
          d_load <= 1;
          $display("State 9");
          //enable <= 0;
          state <= S0;
          end
      default: state <= S0;
      
      endcase
      
end
endmodule
