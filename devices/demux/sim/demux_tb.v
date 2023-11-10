`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 02:18:14 AM
// Design Name: 
// Module Name: demux_tb
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


module demux_tb();

reg clk;
wire [63:0] out1, out2, out3, out4;
reg [1:0] ctrl;
reg [63:0] in;
reg [63:0] place_holder;

demux demux_inst(
    .clk(clk),
    .ctrl(ctrl),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .out4(out4),
    .in(in)
);

integer sim_out;
integer demux_actual;

always #1 clk = ~clk;

initial begin
    sim_out = $fopen("/home/krishnan/tinker_ws/tests/demux_sim_out.txt","w");
    demux_actual = $fopen("/home/krishnan/tinker_ws/tests/demux_true_out.txt","r");
    clk = 0;
    $fscanf(demux_actual,"%d %d %d %d %d %d\n", in, ctrl, place_holder, place_holder, place_holder, place_holder);
    while (!$feof(demux_actual)) begin
        #2 $display("in: %0d ; ctrl: %0d ; out1: %0d ; out2: %0d ; out3: %0d ; out4 : %0d\n",in, ctrl, out1, out2, out3, out4); $fwrite(sim_out,"%0d %0d %0d %0d %0d %0d\n",in, ctrl, out1, out2, out3, out4); $fscanf(demux_actual,"%d %d %d %d %d %d\n", in, ctrl, place_holder, place_holder, place_holder, place_holder);
    end
#1 $display("in: %0d ; ctrl: %0d ; out1: %0d ; out2: %0d ; out3: %0d ; out4 : %0d\n",in, ctrl, out1, out2, out3, out4); $fwrite(sim_out,"%0d %0d %0d %0d %0d %0d\n",in, ctrl, out1, out2, out3, out4); $fclose(sim_out);
#1000 $finish;
end

endmodule
