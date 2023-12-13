`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2023 02:05:38 AM
// Design Name: 
// Module Name: mem_stage
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


module mem_stage(
    input  clk,
    input  en,
    input  [63:0] addr,
    input  [63:0] in,
    output [63:0] out,
    input [4:0] wb_addr_exec,
    input [11:0] wb_imm_exec,
    output reg [4:0] wb_addr_mem,
    output reg [11:0] wb_imm_mem
);

reg w_en;
reg [63:0] addr_mem;
reg [63:0] in_mem;

always @(posedge clk) begin
    w_en <= 0;
    addr_mem <= addr;
    in_mem <= in;
    // buff
    wb_addr_mem <= wb_addr_exec; 
    wb_imm_mem <= wb_imm_exec;
end

always @(negedge clk) begin
    if(en) begin
        w_en <= 1;
    end
    else begin
        w_en <= 0;
    end
end

data_memory data_memory_inst(
    .en(w_en),
//    .addr(addr_mem),
    .addr(addr),
    .in(in),
    .out(out)
);

endmodule
