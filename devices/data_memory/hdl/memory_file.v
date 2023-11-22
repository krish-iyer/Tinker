`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 09:29:24 AM
// Design Name: 
// Module Name: memory_file
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


module data_memory(
    input  clk,
    input  control_signal,
    input   [63:0] address,
    input   [63:0] write_data,
    output reg signed [63:0] output_data
);

reg signed [63:0] memory [0:1024];

always @(posedge clk) 
begin
    output_data <= memory[address];
end

always @(negedge clk) 
begin
    if (control_signal)
        memory[address] <= write_data;
end

endmodule

