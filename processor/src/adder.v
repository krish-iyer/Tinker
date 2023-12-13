`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mojtaba AlShams
// 
// Create Date: 11/11/2023 08:32:23 PM
// Design Name: Adder for signed numbers. 
// Module Name: adder
// Project Name: Let's build a processor
// Target Devices: 
// Tool Versions: 
// Description: 
// Enabel signal (i.e. EN) must always be high to enable the adder to change its output @ the rising clock edge
// The adder will some the two inputs and output them at the outout port.
// Negative input must be in the 2's complement format
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// **Note** negative singed integers can be inputs, however, they must be in 2's comploment format.
//////////////////////////////////////////////////////////////////////////////////
module adder #(parameter WIDTH=63) (
    input [WIDTH:0] a,b,
    output reg [WIDTH:0] out
    );
    
    always @ *
        begin
        out = a+b;
        end
    //assign out = out_w;

    
endmodule