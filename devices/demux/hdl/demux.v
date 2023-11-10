`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 02:02:35 AM
// Design Name: 
// Module Name: demux
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


module demux(
    input clk,
    input [1:0] ctrl,
    input [63:0] in,
    output reg [63:0] out1, out2, out3, out4
);

always @(posedge clk) begin
    case(ctrl)
        2'b00 : begin
            out1 = in; 
            out2 =  0; 
            out3 =  0; 
            out4 =  0;
        end
        2'b01 : begin
            out1 =  0; 
            out2 = in; 
            out3 =  0; 
            out4 =  0;
        end
        2'b10 : begin
            out1 =  0; 
            out2 =  0; 
            out3 = in; 
            out4 =  0;
        end
        2'b11 : begin 
            out1 =  0; 
            out2 =  0; 
            out3 =  0; 
            out4 = in;
        end
    endcase
end
endmodule
