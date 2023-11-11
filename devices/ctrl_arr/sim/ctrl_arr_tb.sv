`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2023 04:25:58 AM
// Design Name: 
// Module Name: ctrl_arr_tb
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


module ctrl_arr_tb();

reg clk;
reg [31:0] in;
wire [31:0] out;


ctrl_arr ctrl_arr_inst (
    .clk(clk),
    .in(in),
    .out(out)
);

always #1 clk = ~clk;

initial begin
    clk=0;
    in = 1;
    #2 in = 2;
    #2 in = 3;
    #2 in = 4;
    #2 in = 5;
    #2 in = 6;
    #2 in = 7;
    #2 in = 8;
    #2 in = 9;
    #2 in = 10;
    #2 in = 11;
    #2 in = 12;
    #2 in = 13;
#50 $finish;
end

always #2 $display("out : %0d",out);

endmodule