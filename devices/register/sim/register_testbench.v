`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 01:29:42 AM
// Design Name: 
// Module Name: register_testbench
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

module Register_Testbench;

// Parameters
parameter CLK_PERIOD = 10;  // Clock period in time units

// Inputs
reg signed [63:0] input_port;
reg clk;

// Outputs
wire signed [63:0] output_latch;

// Instantiate the Register module
Register uut (
    .clk(clk),
    .input_port(input_port),
    .output_latch(output_latch)
);

// Clock generation
initial begin
    clk = 0;
    forever #((CLK_PERIOD / 2)) clk = ~clk;
end

// Initial stimulus
initial begin
    // Initialize input
    input_port = 64'b1101101101101101101101101101101101101101101101101101101101101101;

    // Display results
    $display("Input: %h", input_port);
    $display("Output: %h", output_latch);


    // End simulation
    #100 $finish;
end

endmodule
