`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 09:45:34 AM
// Design Name: 
// Module Name: testing
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

module testing(

    );
    reg cntrl;
reg [63:0] a,b;
wire [63:0] out;

ALU alu1test(
    .a(a),
    .b(b),
    .out(out),
    .cont(2'b11)
    );

initial begin
    a=64'd50;
    b=64'd20;
    #15 $finish;
end

endmodule
