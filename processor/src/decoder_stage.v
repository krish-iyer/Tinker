`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 12:06:34 AM
// Design Name: 
// Module Name: decoder_stage
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


module decoder_stage(
    input clk,
    input [31:0] instr
    );

reg [31:0] instr_decode;

always@(posedge clk) begin
    instr_decode <= instr;
end

decoder decoder_inst(
    .clk(clk),
    .instr(instr_decode)    
  );

endmodule
