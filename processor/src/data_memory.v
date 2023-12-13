`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 12:36:52 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input  en,
    input  [63:0] addr,
    input  [63:0] in,
    output reg [63:0] out
);

reg [63:0] mem [0:511];

always @* begin
    if (en == 0) begin
        out = mem[addr[8:0]];    
    end
    else begin
        mem[addr[8:0]] = in;
    end
end

endmodule