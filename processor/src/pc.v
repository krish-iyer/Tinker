`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 11:14:22 AM
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input stall_en
    );
    
 reg [8:0] addr = 0;
 reg [8:0] buff=0;
 always@(posedge clk) begin
    if(addr <= 13) begin
        buff <= addr + 1;
        addr <= buff;
    end
 end
 
 instr_fetch instr_fetch_inst(
    .clk(clk),
    .stall_en(stall_en),
    .addr(addr)
 );
 
endmodule
