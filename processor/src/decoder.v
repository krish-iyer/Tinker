`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 03:06:55 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input clk,
    input [31:0] instr
    );

    parameter WIDTH = 8;

    reg [4:0] dec_wb_addr;  
    reg [11:0] dec_wb_imm;
    
    reg [4:0] dec_wb_addr;
    reg [11:0] dec_wb_imm;
    
    wire [4:0]  reg_wb_addr;
    wire [11:0] reg_wb_imm;
    
    wire [4:0]  exec_wb_addr;
    wire [11:0] exec_wb_imm;
    
    wire [4:0]  mem_wb_addr;  //A3
    wire [11:0] mem_wb_imm;

    wire [63:0] mem_data_exec;

    reg [4:0] reg_f_addr_1, reg_f_addr_2;  //A1, A2
    wire [63:0] reg_f_in;  //WD3
    wire [63:0] reg_f_out_1, reg_f_out_2; //RD1, RD

    wire [63:0] imm;
    wire [63:0] data_mem_out;

    wire [63:0] alu_out;    // data_mem addr

//    reg [WIDTH-1:0] decode_sig;
    reg [12:0] decode_sig;
    wire [12:0] ctrl_out_1;
    wire [12:0] ctrl_out_2;
    wire [12:0] ctrl_out_3;
    wire [12:0] ctrl_out_4;

    always @* begin
        case (instr[4:0])
            5'h00: begin
                decode_sig = 13'h0106;                 //add rd , rs , rt ->0 0001 0000 0110->0x0106
                dec_wb_addr = instr[9:5];           // rd : addr
                reg_f_addr_1 = instr[14:10];           // rs : addr
                reg_f_addr_2 = instr[19:15];         // rt : addr
            end
            5'h01: begin
                decode_sig = 13'h30;                 //addi rd , L
            end
            5'h02: begin
                decode_sig = 13'h0116;                 //sub rd , rs , rt
                dec_wb_addr = instr[9:5];           // rd : addr
                reg_f_addr_1 = instr[14:10];           // rs : addr
                reg_f_addr_2 = instr[19:15];         // rt : addr
            end
            5'h06: begin
                decode_sig = 13'h0316;                 //and rd , rs , rt
                dec_wb_addr = instr[9:5];           // rd : addr
                reg_f_addr_1 = instr[14:10];           // rs : addr
                reg_f_addr_2 = instr[19:15];         // rt : addr
            end
            5'h07: begin
                decode_sig = 13'h0326;                 //or rd , rs , rt
                dec_wb_addr = instr[9:5];           // rd : addr
                reg_f_addr_1 = instr[14:10];           // rs : addr
                reg_f_addr_2 = instr[19:15];         // rt : addr
            end
            5'h08: begin
                decode_sig = 13'h0336;                 //or rd , rs , rt
                dec_wb_addr = instr[9:5];           // rd : addr
                reg_f_addr_1 = instr[14:10];           // rs : addr
                reg_f_addr_2 = instr[19:15];         // rt : addr
            end
            5'h09: begin
                decode_sig = 13'h0305;                 //not rd , rs
                dec_wb_addr = instr[9:5];           // rd : addr
                reg_f_addr_1 = instr[14:10];           // rs : addr
                reg_f_addr_2 = instr[19:15];         // rt : addr
            end
            5'h0a: begin
                decode_sig = 13'h0506;                 //shiftr rd , rs, rt
                dec_wb_addr = instr[9:5];           // rd : addr
                reg_f_addr_1 = instr[14:10];           // rs : addr
                reg_f_addr_2 = instr[19:15];         // rt : addr
            end
//            5'h08: begin
//                decode_sig = 8'h46;                 //sub rd , rs , rt
//                dec_wb_addr = instr[9:5];           // rd : addr
//                reg_f_addr_1 = instr[14:10];           // rs : addr
//                reg_f_addr_2 = instr[19:15];         // rt : addr
//            end
            5'h17: begin                             // mov rd <- L
                decode_sig  =  13'h1eb4;
                dec_wb_addr = instr[9:5];
                dec_wb_imm = instr[31:20];
            end
            5'h1E: begin                             // st rs -> rd        
                decode_sig = 13'h3A;
                reg_f_addr_2 = instr[14:10];         // rd : data
                reg_f_addr_1 = instr[9:5];           // rs : addr
            end
            5'h1D: begin                               //ld rd <- rs
                decode_sig = 13'h75;
                dec_wb_addr = instr[14:10];          // rd : addr
                reg_f_addr_2 = instr[9:5];           // rs : reg
            end
            5'h1F: begin                               //NOP
                decode_sig = 13'h1F30;
                dec_wb_addr = 5'd0;          // rd : addr
                reg_f_addr_1 = 5'd0;
                reg_f_addr_2 = 5'd0;           // rs : reg
            end
            
        endcase
    end



    ctrl_arr #(.WIDTH(13)) ctrl_arr_inst(
        .clk(clk),
        .in(decode_sig),
        .out1(ctrl_out_1),
        .out2(ctrl_out_2),
        .out3(ctrl_out_3),
        .out4(ctrl_out_4)
    );

    extend extend_inst(
        .en(ctrl_out_3[7]),
        .in(mem_wb_imm),
        .out(imm)
    );

//    mux_2x1 mux_imm_data(
    mux_4x1 mux_imm_data_alu(
        .ctrl({ctrl_out_3[8],ctrl_out_3[6]}),
        .in1(imm),
        .in2(data_mem_out),
        .in3(alu_out),
        
        .out(reg_f_in)
    );

    reg_stage reg_stage_inst(
        .clk(clk),
        .ctrl({ctrl_out_4[2],ctrl_out_1[1:0]}),
        .in(reg_f_in),
        .addr_1(reg_f_addr_1),
        .addr_2(reg_f_addr_2),
        .addr_3(mem_wb_addr),
        .out_1(reg_f_out_1),
        .out_2(reg_f_out_2),
        // buff
        .wb_addr(dec_wb_addr),
        .wb_imm(dec_wb_imm),
        .wb_addr_reg(reg_wb_addr),
        .wb_imm_reg(reg_wb_imm)
    );

    exec_stage exec_stage_inst(
        .clk(clk),
//        .ctrl(ctrl_out_1[5:4]),
        .ctrl({ctrl_out_2[12:9],ctrl_out_2[5:4]}),
        .in1(reg_f_out_1),
        .in2(reg_f_out_2),
        .out(alu_out),
        // in
        .wb_addr_reg(reg_wb_addr),
        .wb_imm_reg(reg_wb_imm),
        // out
        .wb_addr_exec(exec_wb_addr),
        .wb_imm_exec(exec_wb_imm),
        .mem_data(mem_data_exec)
    );

    mem_stage mem_stage_inst(
        .clk(clk),
        .en(ctrl_out_2[3]),
        .addr(alu_out),
        .in(mem_data_exec),
        .out(data_mem_out),
        .wb_addr_exec(exec_wb_addr),
        .wb_imm_exec(exec_wb_imm),
        .wb_addr_mem(mem_wb_addr),
        .wb_imm_mem(mem_wb_imm)
    );

endmodule
