`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 04:45:10 AM
// Design Name: 
// Module Name: arithmetic_operations_testing
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


module arithmetic_operations_testing(

    );
    
reg clk;
reg [31:0] instr;
wire [63:0] out;

decoder_stage decoder_stage_inst(
    .clk(clk),
    .instr(instr)
    );

initial begin
    clk = 1;
    $display("implementing inst#1: mov r5 <- 10, it takes 4 cycles to execute");
    instr = 32'h00a000b7; // mov r5 <- 10, this instruction commit at the 4th cycle since its exectution
    #1 $display("implementing inst#2: mov r6 <- 3, it takes 4 cycles to execute");
    #1 instr = 32'h003000d7; // mov r6 <- 3, this instruction commit at the 4th cycle since its exectution
    #1 $display("implementing inst#3: mov r7 <- 0xFFF, it takes 4 cycles to execute");
    #1 instr = 32'hFFF000F7; // mov r7 <- 0xFFF, this instruction commit at the 4th cycle since its exectution
    $display("implementing inst#4: mov r8 <- 0x333, it takes 4 cycles to execute");
    #1 instr = 32'h33300117; // mov r8 <- 0x333, this instruction commit at the 4th cycle since its exectution
    #1
    #1 instr = 32'h00300137; // mov r9 <- 0x3, this instruction commit at the 4th cycle since its exectution
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[5] == 64'd10) $display("inst#1 execution is a success");
    else  $display("inst#1 execution is a failure");
    $display("implementing inst#5: r9 <- 0x3, it takes 4 cycles to execute");
    $display("implementing inst#6: add r1, r5, r6, it takes 4 cycles to execute");
    
    #1 instr = 32'h00031420;  // add r1, r5, r6
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[6] == 64'd3) $display("inst#2 execution is a success");
    else  $display("inst#2 execution is a failure");
    #1 instr = 32'h0000001f;
    $display("implementing inst#7: sub r2, r5, r6, it takes 4 cycles to execute");
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[7] == 64'hFFF) $display("inst#3 execution is a success");
    else  $display("inst#3 execution is a failure");
    #1 instr = 32'h00031442;  // sub r2, r5, r6
    $display("implementing inst#8: and r3, r7, r8, it takes 4 cycles to execute");
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[8] == 64'h333) $display("inst#4 execution is a success");
    else  $display("inst#4 execution is a failure");
    #1 instr = 32'h00041c66;  // and r3, r7, r8
    $display("implementing inst#9: or r4, r7, r8, it takes 4 cycles to execute%d",decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[4]);
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[9] == 64'd3) $display("inst#5 execution is a success");
    else  $display("inst#5 execution is a failure");
    #1 instr = 32'h00041c87;  // or r4, r7, r8
    $display("implementing inst#10: xor r1, r7, r8, it takes 4 cycles to execute");
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[1] == 64'd13) $display("inst#6 execution is a success");
    else  $display("inst#6 execution is a failure");
    #1 instr = 32'h00041c28;  // xor r1, r7, r8
    $display("implementing inst#11: not r2, r7, it takes 4 cycles to execute");
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[2] == 64'd7) $display("inst#7 execution is a success");
    else  $display("inst#7 execution is a failure");
    #1 instr = 32'h00001c49;  // not r2, r7
    $display("implementing inst#12: shftr r3, r8, r9, it takes 4 cycles to execute");
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[3] == 64'h333) $display("inst#8 execution is a success");
    else  $display("inst#8 execution is a failure");
    #1 instr = 32'h0004a06a;  // shftr r3, r8, r9
    #1;
    #1 instr = 32'h0000001f; //NOP
    //$display("content of r5 is %d, content of r6 is %d, content of r7 is %h, content of r8 is %h, content of r9 is %h",decoder_inst.reg_stage_inst.register_file_inst.mem[5],decoder_inst.reg_stage_inst.register_file_inst.mem[6],decoder_inst.reg_stage_inst.register_file_inst.mem[7],decoder_inst.reg_stage_inst.register_file_inst.mem[8],decoder_inst.reg_stage_inst.register_file_inst.mem[9]);
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[4] == 64'hfff) $display("inst#9 execution is a success");
    else  $display("inst#9 execution is a failure: %d",decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[4]);
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[1] == 64'hccc) $display("inst#10 execution is a success");
    else  $display("inst#10 execution is a failure");
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[2] == 64'hfffffffffffff000) $display("inst#11 execution is a success");
    else  $display("inst#11 execution is a failure");
    #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[3] == 64'h66) $display("inst#12 execution is a success");
    else  $display("inst#12 execution is a failure");

end

always #0.5 clk = ~clk;

endmodule
