`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 08:27:10 AM
// Design Name: 
// Module Name: mux_4x1
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


module mux_4x1(
    input [1:0] ctrl,
    input [63:0] in1, in2, in3,
    output reg [63:0] out
    );
    always @*
    begin
        case (ctrl)
            2'd0: begin
                out = in1;
            end
            2'd1: begin
                out = in2;
            end
            2'd2: begin
                out = in3;                 
            end
        endcase
    end
endmodule
