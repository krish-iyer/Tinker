`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 08:02:33 PM
// Design Name: 
// Module Name: ALU
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
//ALU1: adder and subtracter
module ALU1 (
    input [63:0] a,b,
    input  cont, //if 0 add if 1 subtruct
    output [63:0] out
    );
    wire [63:0] b1, b2;
    adder #(.WIDTH(63)) add1 (.a(a), .b(b2), .out(out));
    complement2_combinational #( .WIDTH(63)) comp1 (.a(b), .out(b1));
    assign b2 = cont ? b1 : b;
endmodule

//ALU2: integer multiplier
module ALU2 (
    input clk,
    input [63:0] a,b,
    output reg [63:0] out
//    output reg valid
    );
    reg [63:0] out_w1, out_w2, out_w3;
    reg [2:0] valid_w;
    reg [63:0] out_w3;
    
    always @ *//fggndf
        begin
        out_w1 = a*b;
        end
    //assign out = out_w;
    always @(posedge clk)
    begin
    out_w2 <= out_w1;
    out_w3 <= out_w2;
    out <= out_w3;
    end

endmodule

//ALU3: integer divider
module ALU3 (
    input clk,
    input [63:0] a,b,
    output reg [63:0] out
    );
    reg [63:0] out_w1, out_w2, out_w3, out_w4, out_w5, out_w6, out_w7, out_w8;
    
    always @ *
        begin
        out_w1 = a;
        end
    //assign out = out_w;
    always @(posedge clk)
    begin
    out_w2 <= out_w1;
    out_w3 <= out_w2;
    out_w4 <= out_w3;
    out_w5 <= out_w4;
    out_w6 <= out_w5;
    out_w7 <= out_w6;
    out_w8 <= out_w7;
    out <= out_w8;
    end

endmodule

//ALU4: logic, not, and, or, xor
module ALU4 (
    input [63:0] a,b,
    input [1:0] cont, //00:not, 01:and, 10:or, 11:xor
    output [63:0] out
    );
    logic logic1 (.ctrl(cont), .op1(a), .op2(b), .dst(out));
endmodule

//ALU5: bits shifter, 0 right shift, 1 left shift
//The shifter adds zeros to the right or to the left
module ALU5 (
    input [63:0] a,b,
    input cont, //0:right shift, 1:left shift
    output [63:0] out
    );
    Shifter Shifter1 (.control_signal(cont), .input_port_1(a), .input_port_2(b), .output_latch(out));
endmodule

//ALU6: add4
module ALU6 (
    input clk, EN,
    input [31:0] a,
    output [31:0] out
    );
    add4 #(.WIDTH(31)) add4_1 (.clk(clk), .EN(EN), .a(a), .out(out));
endmodule

/////ALU with the full control bits
//module ALU (
//    input clk, EN,
//    input [63:0] a,b,
//    input [5:0] cont,
//    output reg [63:0] out
//    );
//    wire [63:0] out1, out2, out3, out4, out5;
//    wire [31:0] out6;
//    reg [5:0] cont_w;
//    assign alu3_cont_bit1 = ~(cont[0]^cont[1]);
//    always @ (posedge clk)
//    cont_w <= cont;
//    
//    ALU1 alu_1 (.clk(clk), .EN(EN),.a(a), .b(b), .cont(cont[1]), .out(out1));
//    ALU2 alu_2 (.clk(clk), .a(a), .b(b), .out(out2));
//    ALU3 alu_3 (.clk(clk), .a(a), .b(b), .out(out3));
//    ALU4 alu_4 (.clk(clk), .a(a), .b(b), .cont({alu3_cont_bit1,~cont[0]}), .out(out4));
//    ALU5 alu_5 (.clk(clk), .a(a), .b(b), .cont(cont[2]), .out(out5));
//    ALU6 alu_6 (.clk(clk), .EN(EN), .a(a[31:0]), .out(out6));

//    always @ *
//    begin
//    case (cont_w)
//    6'd0: out = out1;
//    6'd1: out = out1;
//    6'd2: out = out1;
//    6'd3: out = out1;
//    6'd4: out = out2;
//    6'd5: out = out3;
//    6'd6: out = out4;
//    6'd7: out = out4;
//    6'd8: out = out4;
//    6'd9: out = out4;
//    6'd10: out = out5;
//    6'd11: out = out5;
//    6'd12: out = out5;
//    6'd13: out = out5;
//    6'd33: out = out6;
//    default: out = 64'd0;
//    endcase
//    end
//endmodule

//combinational ALU with only two control bits
//00: sub | 01: xor | 10: shift right | 11: bypass
module ALU (
    input [63:0] a,b,
//    input [5:0] cont,
    input [5:0] cont,
    output reg [63:0] out
    );

    wire [63:0] out1, out2, out3, out4, out5;
    
    ALU1 alu_add_sub (.a(a), .b(b), .cont(cont[0]), .out(out1));
    //ALU2 alu_mul (.a(a), .b(b), .out(out2));
    //ALU3 alu_div (.a(a), .b(b), .out(out3));
    ALU4 alu_logic (.a(a), .b(b), .cont(cont[1:0]), .out(out4));
    ALU5 alu_5 (.a(a), .b(b), .cont(cont[0]), .out(out5));
//    ALU6 alu_6 (.a(a[31:0]), .out(out6));
    
    always @ *
    begin
    case (cont)
    6'd0: out = out1;
    6'd1: out = out1;
    6'd2: out = out2;
    6'd3: out = out3;
    6'd4: out = out4;
    6'd5: out = out4;
    6'd6: out = out4;
    6'd7: out = out4;
    6'd8: out = out5;
    6'd9: out = out5;
    6'b111111: out = a;
    endcase
    end

endmodule