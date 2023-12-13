`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 11:05:34 PM
// Design Name: 
// Module Name: ctrl_arr
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

module ctrl_arr #(
    parameter WIDTH=8)(
    input clk,
    input [WIDTH-1:0] in,
    output reg [WIDTH-1:0] out1, out2, out3, out4
);

always@(posedge clk) begin    
    out1 <= in;
    out2 <= out1;
    out3 <= out2;
    out4 <= out3;
end
endmodule
