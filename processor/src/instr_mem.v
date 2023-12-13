`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 11:31:12 PM
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(
    input  [8:0] addr,
    output reg [31:0] out
);

reg [31:0] mem [0:511];

    initial begin
        mem[0] = 32'h00a000b7;
        mem[1] = 32'h003000d7;
        mem[2] = 32'hFFF000F7;
        mem[3] = 32'h33300117;
        mem[4] = 32'h00300137;
        mem[5] = 32'h0000001f;
        mem[6] = 32'h00031420;
        mem[7] = 32'h00031442;
        mem[8] = 32'h00041c66;
        mem[9] = 32'h00041c87;
        mem[10] = 32'h00041c28;
        mem[11] = 32'h00001c49;
        mem[12] = 32'h0004a06a;
        mem[13] = 32'h0000001f;
    end
always @* begin
    out = mem[addr[8:0]];    
end

endmodule
