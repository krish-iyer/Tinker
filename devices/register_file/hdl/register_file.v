`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 01:44:59 AM
// Design Name: 
// Module Name: register_file
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

module RegisterFile (
    input  clk,
    input  [1:0] control_signal,
    input  signed [63:0] input_port_1,
    input  signed [63:0] input_port_2,
    output reg signed [63:0] output_latch_1,
    output reg signed [63:0] output_latch_2
);

reg signed [63:0] registers [0:31];

always @(posedge clk) 
begin
    case (control_signal)
        2'b00:
        begin
            output_latch_1 <= output_latch_1;
            output_latch_2 <= output_latch_2;
        end
        2'b01: 
            output_latch_1 <= registers[input_port_1];
        2'b10: 
        begin
            output_latch_1 <= registers[input_port_1];
            output_latch_2 <= registers[input_port_2];
        end
        2'b11: 
            registers[input_port_2] <= input_port_1;
        
    endcase
end

endmodule

