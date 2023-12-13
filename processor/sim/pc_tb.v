`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 11:38:33 AM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb();
    
    
    reg clk;
    reg stall_en = 1;

    pc pc_inst(
        .clk(clk),
        .stall_en(stall_en)
    );

    
    initial begin
        clk = 1;
        #5;
        #1 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[5] == 64'd10) $display("inst#1 execution is a success");
            else  $display("inst#1 execution is a failure");
        
        #2 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[6] == 64'd3) $display("inst#2 execution is a success");
            else  $display("inst#2 execution is a failure");
        
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[7] == 64'hFFF) $display("inst#3 execution is a success");
            else  $display("inst#3 execution is a failure");
        
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[8] == 64'h333) $display("inst#4 execution is a success");
            else  $display("inst#4 execution is a failure");
        
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[9] == 64'd3) $display("inst#5 execution is a success");
            else  $display("inst#5 execution is a failure");
        #4;
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[1] == 64'd13) $display("inst#6 execution is a success");
            else  $display("inst#6 execution is a failure");
        
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[2] == 64'd7) $display("inst#7 execution is a success");
            else  $display("inst#7 execution is a failure");
   
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[3] == 64'h333) $display("inst#8 execution is a success");
            else  $display("inst#8 execution is a failure");
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[4] == 64'hfff) $display("inst#9 execution is a success");
            else  $display("inst#9 execution is a failure: %d",decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[4]);
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[1] == 64'hccc) $display("inst#10 execution is a success");
            else  $display("inst#10 execution is a failure");
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[2] == 64'hfffffffffffff000) $display("inst#11 execution is a success");
            else  $display("inst#11 execution is a failure");
        #3 if (decoder_stage.decoder_inst.reg_stage_inst.register_file_inst.mem[3] == 64'h66) $display("inst#12 execution is a success");
            else  $display("inst#12 execution is a failure");
        #50 $finish;

    end

always #0.5 clk = ~clk;

endmodule
