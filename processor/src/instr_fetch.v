`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 09:09:30 PM
// Design Name: 
// Module Name: instr_fetch
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


module instr_fetch(
    input clk,
    input stall_en,
    input [8:0] addr
    );

reg [8:0] addr_reg = 0;
wire [31:0] instr;

always@(posedge clk) begin
    if(stall_en) begin
        addr_reg <= addr;
    end
end

instr_mem instr_mem_inst(
    .addr(addr_reg),
    .out(instr)
);

decoder_stage decoder_stage_inst(
    .clk(clk),
    .instr(instr)    
  );

endmodule

