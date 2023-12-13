`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 02:06:36 AM
// Design Name: 
// Module Name: register_gile_testbench
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


module RegisterFile_Testbench;

// Parameters
parameter CLK_PERIOD = 10;  // Clock period in time units

// Inputs
reg clk;
reg [1:0] control_signal;
reg signed [63:0] input_port_1;
reg signed [63:0] input_port_2;

// Outputs
wire signed [63:0] output_latch_1;
wire signed [63:0] output_latch_2;

// Instantiate the RegisterFile module
register_file register_file_inst (
    .clk(clk),
    .ctrl(control_signal),
    .in_1(input_port_1),
    .in_2(input_port_2),
    .out_1(output_latch_1),
    .out_2(output_latch_2)
);

// Clock generation
initial begin
    clk = 1;
    // Write a value to the register file
    control_signal = 2'b11; // W
    input_port_1 = 64'b1101101101101101101101101101101101101101101101101101101101101101;
    input_port_2 = 5'b00000; // Store in register 1

    #1
    input_port_1 = 64'hFFFFFFFF_FFFFFFFF;
    input_port_2 = 5'b00001; // Store in register 1
    // Display results
    $display("Writing value: %h to register %d", input_port_1, input_port_2);

    // Wait for a few clock cycles
    #1;
    
    // Read the value from the register file
    control_signal = 2'b10; 

    #1
    // Display results
    $display("Reading value from register %d: %h", input_port_1, output_latch_1);

    #5 $finish;
end

always #0.5 clk = ~clk;


endmodule

