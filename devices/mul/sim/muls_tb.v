`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 09:56:54 PM
// Design Name: 
// Module Name: muls_tb
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


module muls_tb();

reg [31:0] t_op1, t_op2;
reg [31:0] op1, op2;
reg [63:0] place_holder;
wire [63:0] dst;
reg clk;

muls muls_inst(
    .clk(clk),
    .op1(op1),
    .op2(op2),
    .dst(dst)
);

integer sim_out;
integer muls_actual;

always #1 clk = ~clk;

initial begin
    sim_out = $fopen("/home/krishnan/tinker_ws/muls_sim_out.txt","w");
    muls_actual = $fopen("/home/krishnan/tinker_ws/muls_true_out.txt","r");
    clk = 0;
    $fscanf(muls_actual,"%d %d %d\n", op1, op2, place_holder);
    while (!$feof(muls_actual)) begin
        #6 $display("op1: %d ; op2: %d ; dst: %d",op1, op2, dst); $fwrite(sim_out, "%0d %0d %0d\n",op1, op2, dst); $fscanf(muls_actual,"%d %d %d\n", op1, op2, place_holder);
    end

#9997 $display("op1: %d ; op2: %d ; dst: %d",op1, op2, dst); 
#9998 $fwrite(sim_out, "%0d %0d %0d",op1, op2, dst);
#9999 $fclose(sim_out);
#10000 $finish;
end

endmodule
