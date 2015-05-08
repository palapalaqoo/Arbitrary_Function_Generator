`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:38 12/01/2009 
// Design Name: 
// Module Name:    DELAY_BUF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module top(input_a,clk,comb);
input input_a;
input clk;
output comb;
reg input_a_reg;
//synthesis attribute keep of input_a_reg is "true"
BUF mybuf (.I(input_a_reg),.O(comb));
always @(posedge clk)
begin
input_a_reg <= input_a;
end
endmodule