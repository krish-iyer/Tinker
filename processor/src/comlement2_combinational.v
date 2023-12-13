`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 09:54:56 PM
// Design Name: 
// Module Name: comlement2_combinational
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


module complement2_combinational #(parameter WIDTH=63) (
    input [WIDTH:0] a,
    output reg [WIDTH:0] out
    //output [WIDTH:0] out
    );
    
    reg [WIDTH:0] out_w1;
    
    always @ *
        begin
        out_w1 = ~a;
        out = out_w1+64'd1;
        end

endmodule
