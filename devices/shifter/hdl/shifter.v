`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 12:35:35 AM
// Design Name: 
// Module Name: shifter
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


module Shifter (
    input wire clk,
    input wire signed [63:0] input_port_1,
    input wire [63:0] input_port_2,
    input wire control_signal,
    output reg signed [63:0] output_latch
);

always @(posedge clk) begin
    if (input_port_2 == 64'b0) begin
        // No shift
        output_latch <= input_port_1;
    end else if (control_signal == 1'b0) begin
        // Right shift
        output_latch <= input_port_1 >> input_port_2;
    end else begin
        // Left shift
        output_latch <= input_port_1 << input_port_2;
    end
end

endmodule