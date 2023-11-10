`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 09:32:03 PM
// Design Name: 
// Module Name: muls
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module muls(
    input clk,
    input [63:0] op1, op2,
    input [63:0] dst 
);

    mult_gen_0 mult_gen_0_inst (
        .CLK(clk),      // input wire   clk
        .A(op1[31:0]),  // input wire   [31 : 0] op1
        .B(op2[31:0]),  // input wire   [31 : 0] op2
        .P(dst)         // output wire  [63 : 0] dst
    );

endmodule
