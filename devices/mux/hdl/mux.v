`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 12:23:27 AM
// Design Name: 
// Module Name: mux
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


module mux(
    input clk,
    input [1:0] ctrl,
    input [63:0] in1, in2, in3, in4,
    output reg [63:0] out
);

always @(posedge clk) begin
    case(ctrl)
        2'b00 : out = in1;
        2'b01 : out = in2;
        2'b10 : out = in3;
        2'b11 : out = in4;
    endcase
end

endmodule
