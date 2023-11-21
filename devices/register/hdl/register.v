`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 01:26:13 AM
// Design Name: 
// Module Name: register
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


module Register (
    input wire clk,
    input wire signed [63:0] input_port,
    output reg signed [63:0] output_latch
);

always @(posedge clk) begin
    // Update the register on the positive edge of the clock
    output_latch <= input_port;
end

endmodule