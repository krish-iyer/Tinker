`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2023 02:05:00 AM
// Design Name: 
// Module Name: reg_stage
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


module reg_stage(
    // reg file i/o
    input  clk,
    input  [2:0] ctrl,
    input  [63:0] in,
    input  [4:0] addr_1,
    input  [4:0] addr_2,
    input  [4:0] addr_3,
    output [63:0] out_1,
    output [63:0] out_2,
    // buff
    input [4:0] wb_addr,
    input [11:0] wb_imm,
    output [4:0] wb_addr_reg,
    output [11:0] wb_imm_reg
);

reg [63:0] in_reg;
reg [4:0] addr_3_reg;
reg w_en=0;

assign  wb_addr_reg = wb_addr;
assign  wb_imm_reg  = wb_imm;

always @(posedge clk) begin
    w_en <= 0;
    in_reg <= in;
    addr_3_reg <= addr_3;

end

always @(negedge clk) begin
    if(ctrl[2]) begin
        w_en <= 1;
    end
    else begin
        w_en <= 0;
    end
end


register_file register_file_inst(
    .w_en(w_en),
    .r_mode(ctrl[1:0]),
    .in(in_reg),
    .addr_1(addr_1),
    .addr_2(addr_2),
    .addr_3(addr_3_reg),
    .out_1(out_1),
    .out_2(out_2)
);

endmodule
