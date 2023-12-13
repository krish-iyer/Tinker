`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 10:55:01 PM
// Design Name: 
// Module Name: instr_fetch_tb
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


module instr_fetch_tb();

    reg clk;
    reg stall_en = 1;
    reg [8:0] addr_in;
    reg program_en;
    reg [31:0] program_instr;
    wire [31:0] instr;

    instr_fetch instr_fetch_inst(
        .clk(clk),
        .stall_en(stall_en),
        .addr(addr_in),
        .program_en(program_en),
        .program_instr(program_instr),
        .instr(instr)
    );

    reg [31:0] instr_mem [0:13];

    initial begin
        instr_mem[0] = 32'h00a000b7;
        instr_mem[1] = 32'h003000d7;
        instr_mem[2] = 32'hFFF000F7;
        instr_mem[3] = 32'h33300117;
        instr_mem[4] = 32'h00300137;
        instr_mem[5] = 32'h0000001f;
        instr_mem[6] = 32'h00031420;
        instr_mem[7] = 32'h00031442;
        instr_mem[8] = 32'h00041c66;
        instr_mem[9] = 32'h00041c87;
        instr_mem[10] = 32'h00041c28;
        instr_mem[11] = 32'h00001c49;
        instr_mem[12] = 32'h0004a06a;
        instr_mem[13] = 32'h0000001f;
    end

    integer addr;
    initial begin
        clk = 1;
        program_en = 1;
        #2;
        for ( addr = 0; addr <= 14; addr = addr + 1) begin
            addr_in = addr;
            program_instr = instr_mem[addr];
            #1;
        end
        program_en = 0;
        addr_in = 13;
        #1 addr_in = 0;
        #1;
        #1 addr_in = 1;
        #1;
        #1 addr_in = 2;
        #1;
        #1 addr_in = 3;
        #1;
        #1 addr_in = 4;
        #1;
        #1 addr_in = 6;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[5] == 64'd10) $display("inst#1 execution is a success");
            else  $display("inst#1 execution is a failure");
        #1 addr_in = 7;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[6] == 64'd3) $display("inst#2 execution is a success");
            else  $display("inst#2 execution is a failure");
        #1 addr_in = 8;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[7] == 64'hFFF) $display("inst#3 execution is a success");
            else  $display("inst#3 execution is a failure");
        #1 addr_in = 9;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[8] == 64'h333) $display("inst#4 execution is a success");
            else  $display("inst#4 execution is a failure");
        
        #1 addr_in = 10;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[9] == 64'd3) $display("inst#5 execution is a success");
            else  $display("inst#5 execution is a failure");
        
        #1 addr_in = 11;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[1] == 64'd13) $display("inst#6 execution is a success");
            else  $display("inst#6 execution is a failure");
        
        #1 addr_in = 12;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[2] == 64'd7) $display("inst#7 execution is a success");
            else  $display("inst#7 execution is a failure");
   
        #1 addr_in = 13;
        #1;
        if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[3] == 64'h333) $display("inst#8 execution is a success");
            else  $display("inst#8 execution is a failure");
        #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[4] == 64'hfff) $display("inst#9 execution is a success");
            else  $display("inst#9 execution is a failure: %d",decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[4]);
        #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[1] == 64'hccc) $display("inst#10 execution is a success");
            else  $display("inst#10 execution is a failure");
        #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[2] == 64'hfffffffffffff000) $display("inst#11 execution is a success");
            else  $display("inst#11 execution is a failure");
        #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[3] == 64'h66) $display("inst#12 execution is a success");
            else  $display("inst#12 execution is a failure");
        #50 $finish;

    end

always #0.5 clk = ~clk;

endmodule
