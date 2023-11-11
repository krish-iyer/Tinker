`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 03:56:06 AM
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
    parameter WIDTH=32,
    parameter LENGTH=5)(
    input clk,
    input [WIDTH-1:0] in,
    output reg [WIDTH-1:0] out
);

reg [WIDTH-1:0] fifo [0:LENGTH-1];
integer i;

always@(posedge clk) begin
    
    for (i=0;i<LENGTH-1;i=i+1) begin
        fifo[i+1] <= fifo[i];        
    end
    out <= fifo[LENGTH-1];
    fifo[0] <= in;
end

endmodule
