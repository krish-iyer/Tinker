`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 12:41:32 AM
// Design Name: 
// Module Name: shifter_Testbench
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


module Shifter_Testbench;

// Parameters
parameter CLK_PERIOD = 10;  // Clock period in time units

// Inputs
reg signed [63:0] input_port_1;
reg [63:0] input_port_2;
reg control_signal;
reg clk;

// Outputs
wire signed [63:0] output_latch;

// Instantiate the Shifter module
Shifter uut (
    .clk(clk),
    .input_port_1(input_port_1),
    .input_port_2(input_port_2),
    .control_signal(control_signal),
    .output_latch(output_latch)
);

// Clock generation
initial begin
    clk = 0;
    forever #((CLK_PERIOD / 2)) clk = ~clk;
end

// Initial stimulus
initial begin
    // Initialize inputs
    input_port_1 = 64'b1101101101101101101101101101101101101101101101101101101101101101;
    input_port_2 = 6'b010110;  // Example shift amount
    control_signal = 1'b0;     // Right shift

    // Apply stimulus
    #10 control_signal = 1'b1;  // Trigger the shift on the positive edge of the control signal
    #10 control_signal = 1'b0;
    
    // Display results
    $display("Input: %h, Shift Amount: %h, Control Signal: %b", input_port_1, input_port_2, control_signal);
    $display("Output: %h", output_latch);

    // Repeat for left shift
    input_port_2 = 6'b010110;
    control_signal = 1'b1;     // Left shift

    #10 control_signal = 1'b0;
    
    $display("Input: %h, Shift Amount: %h, Control Signal: %b", input_port_1, input_port_2, control_signal);
    $display("Output: %h", output_latch);

    // Add more test cases as needed

    // End simulation
    #10 $finish;
end

endmodule
