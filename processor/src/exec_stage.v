`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2023 02:05:16 AM
// Design Name: 
// Module Name: exec_stage
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


module exec_stage(
    input clk,
    input [5:0] ctrl,
    input [63:0] in1,
    input [63:0] in2,
    output reg [63:0] out,
    //the below is independent to the ALU. It is just being buffered
    input [4:0] wb_addr_reg,
    input [11:0] wb_imm_reg,
    output reg [4:0] wb_addr_exec,
    output reg [11:0] wb_imm_exec,
    output reg [63:0] mem_data
);

reg [63:0] in1_exec;
reg [63:0] in2_exec;
wire [63:0] out_w;

always @(posedge clk) begin
    in1_exec <= in1;
    in2_exec <= in2;
    mem_data <= in2;
    out <= out_w;
    wb_addr_exec <= wb_addr_reg;
    wb_imm_exec  <= wb_imm_reg;
end
    
ALU ALU_inst(
    .cont(ctrl),
    .a(in1_exec),
    .b(in2_exec),
    .out(out_w)
);

endmodule
