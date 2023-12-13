`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 03:06:50 AM
// Design Name: 
// Module Name: logic
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


module logic(
    input [1:0] ctrl,
    input [63:0] op1,
    input [63:0] op2,
    output reg [63:0] dst
);

always @* begin
    case(ctrl)
        2'b00: begin
            dst = ~op1;
        end
        2'b01: begin 
            dst = op1 & op2;
        end
        2'b10: begin
            dst = op1 | op2;
        end
        2'b11: begin
            dst = op1 ^ op2;
        end
    endcase
end

endmodule