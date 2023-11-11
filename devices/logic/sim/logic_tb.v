`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 03:14:19 AM
// Design Name: 
// Module Name: logic_tb
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


module logic_tb();

reg [1:0] ctrl;
reg [63:0] op1, op2;
reg [63:0] place_holder;
wire [63:0] dst;
reg clk;

logic logic_inst(
    .clk(clk),
    .ctrl(ctrl),
    .op1(op1),
    .op2(op2),
    .dst(dst)
);

integer sim_out;
integer actual;

always #1 clk = ~clk;

initial begin
    sim_out = $fopen("/home/krishnan/tinker_ws/Tinker/tests/logs/logic/logic_sim_out.txt","w");
    actual = $fopen("/home/krishnan/tinker_ws/Tinker/tests/logs/logic/logic_true_out.txt","r");
    clk = 0;
    $fscanf(actual,"%d %d %d %d\n", op1, op2, ctrl, place_holder);
    while (!$feof(actual)) begin
        #2 $display("op1: %d ; op2: %d ; ctrl : %d ; dst: %d",op1, op2, ctrl, dst); $fwrite(sim_out, "%0d %0d %d %0d\n",op1, op2, ctrl, dst); $fscanf(actual,"%d %d %d %d\n", op1, op2, ctrl, place_holder);
    end

#1 $display("op1: %d ; op2: %d ; ctrl : %d ; dst: %d",op1, op2, ctrl, dst);
#1 $fwrite(sim_out, "%0d %0d %d %0d\n",op1, op2, ctrl, dst);
#1 $fclose(sim_out);
#1000 $finish;
end

endmodule
