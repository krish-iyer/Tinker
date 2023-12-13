`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 05:54:36 PM
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();

reg clk;
reg [31:0] instr;

decoder decoder_inst(
    .clk(clk),
    .instr(instr)    
    );

initial begin
    clk = 1;
    instr = 32'h00500017; // mov r0 <- 5
    #1
    // instr = 32'h00000000;
    // #3
    instr = 32'h00000038; // mov r1 <- 0
    #1
    instr = 32'h00000000;
    #3
    instr = 32'h0000003E;   // st r1 <- r0
    #1
    instr = 32'h00000000;
    #3
    instr = 32'h0000083D;   // st r1 <- r0
    #1
    instr = 32'h00000000;
    $display("This is the test %d",decoder_inst.reg_stage_inst.register_file_inst.mem[0]);
    #15 $finish;
end

always #0.5 clk = ~clk;

endmodule
