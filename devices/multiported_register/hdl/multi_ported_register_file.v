`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 02:17:13 AM
// Design Name: 
// Module Name: multi_ported_register_file
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


module multi_ported_register_file(
    input  clk,
    input  [3:0] control_signal,
    input   [63:0] input_port_1,
    input   [63:0] input_port_2,
    input   [63:0] input_port_3,
    input   [63:0] input_port_4,
    output reg  [63:0] output_latch_1,
    output reg  [63:0] output_latch_2,
    output reg  [63:0] output_latch_3,
    output reg  [63:0] output_latch_4
);
    
    reg signed [63:0] registers [0:31];
    always@(posedge clk)
    begin
        case (control_signal)
            
            0 : //read from 1 port
            begin
                output_latch_1 <= registers[input_port_1];
                
            end
            1 : //read from 2 ports
            begin
                output_latch_1 <= registers[input_port_1];
                output_latch_2 <= registers[input_port_2];
            end
            2 : //read from 3 ports
            begin
                output_latch_1 <= registers[input_port_1];
                output_latch_2 <= registers[input_port_2];
                output_latch_3 <= registers[input_port_3];
            end
            3 : //read from 4 ports
            begin
                output_latch_1 <= registers[input_port_1];
                output_latch_2 <= registers[input_port_2];
                output_latch_3 <= registers[input_port_3];
                output_latch_4 <= registers[input_port_4];
            end
            4 ://read from 1 port write from 1 port
            begin
                output_latch_1 <= registers[input_port_1];
                registers[input_port_3] <= input_port_2;
            end
            5 ://read from 2 ports write from 1 port
            begin
                output_latch_1 <= registers[input_port_1];
                output_latch_2 <= registers[input_port_2];
                registers[input_port_4] <= input_port_3;
                
                
            end
            6 : // write from 1 port
            begin
                registers[input_port_1] <= input_port_2;
            end
            7 : // write from 2 ports
            begin
                registers[input_port_1] <= input_port_2;
                registers[input_port_3] <= input_port_4;
            end
            
        
        endcase
    end
endmodule
