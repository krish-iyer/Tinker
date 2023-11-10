`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 12:29:03 AM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();

reg clk;
reg [63:0] in1, in2, in3, in4;
reg [1:0] ctrl;
wire [63:0] out;
reg [63:0] place_holder;

mux mux_inst(
    .clk(clk),
    .ctrl(ctrl),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .out(out)
);

integer sim_out;
integer muls_actual;

always #1 clk = ~clk;

initial begin
    sim_out = $fopen("/home/krishnan/tinker_ws/tests/mux_sim_out.txt","w");
    muls_actual = $fopen("/home/krishnan/tinker_ws/tests/mux_true_out.txt","r");
    clk = 0;
    $fscanf(muls_actual,"%d %d %d %d %d %d\n", in1, in2, in3, in4, ctrl, place_holder);
    while (!$feof(muls_actual)) begin
        #2 $display("in1: %0d ; in2: %0d ; in3: %0d ; in4: %0d ; ctrl: %0d ; out : %0d\n",in1, in2, in3, in4, ctrl, out); $fwrite(sim_out, "%0d %0d %0d %0d %0d %0d\n",in1, in2, in3, in4, ctrl, out); $fscanf(muls_actual,"%d %d %d %d %d %d\n", in1, in2, in3, in4, ctrl, place_holder);
    end
#1 $display("in1: %0d ; in2: %0d ; in3: %0d ; in4: %0d ; ctrl: %0d ; out : %0d",in1, in2, in3, in4, ctrl, out); $fwrite(sim_out, "%0d %0d %0d %0d %0d %0d\n",in1, in2, in3, in4, ctrl, out); $fclose(sim_out);
#1000 $finish;
end

endmodule
