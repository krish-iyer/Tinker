CS258 - Course Project
Building a Tinker Processor

Contributors:
1- Achref Rebai
2- Krishnan Iyer
3- Mojtaba AlShams

This readme file is to guide the reader through the project.
The team built a pipelined archeticture as shown on the below diagram.

![microarchitecture_diagram](https://github.com/krish-iyer/Tinker/assets/111680200/ca1ce821-30f2-41eb-a539-536ebe15c88e)

The instruction, assuming no bubbles, takes 4 cycles to finish. After it gets fetched it will go through the register stage, then execution stage and finally the memory stage. The [decoder](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/decoder.v) decodes the instruciton to produce the correct control bits in the control register. Then it is moved into the [regester stage](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/reg_stage.v) where the needed registers will be accesed and its content fed to next stages. Next, [execution stage](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/exec_stage.v) will execute the arithmetic operation, if it is requested, or just pass it to memory stage. Finally, [memory stage](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/mem_stage.v) access the memory, if that is needed, and feedback the register stage with data.
We followed [this instruction format](https://github.com/krish-iyer/Tinker/wiki/Specifications#instruction-format) as provided in the "instruction manual". Refering to it, the following instrucitons were already tested on the microarchetecture: add, sub, and, or, xor, not, shftr, shftl and mov.
The instrucitons were processed with the control signals as described in [here](https://github.com/krish-iyer/Tinker/wiki/Specifications#control-register).

The tests can be reproduced using [this veriog testbench](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sim_1/new/arithmetic_operations_testing.v). A screenshot of the test is below and its results is shown after it.
![test code](https://github.com/krish-iyer/Tinker/assets/111680200/503451c1-8a87-4910-b68a-e6ae5ce8baf0)

![test results](https://github.com/krish-iyer/Tinker/assets/111680200/ed79a4f1-dee1-4972-a4cc-6f276f6da358)

The following devices were used to build the processor: Adder, Shifter, Logic, Two’s Complement, Register File, Multiplexer, Control Array(m x n), Add4, Register and Data Memory (i.e. Register). The summary of thier area and power consumption is shown in the below table.
![processor area and power](https://github.com/krish-iyer/Tinker/assets/111680200/92866012-c139-40e9-8999-a5d1b9987ec2)

It can be seen from the table that the total area of the processor is 128552nm2 and it consumes 33.5W. Running the program which was tested on the testbench yielded 0.8 which corresponds to 0.0239 instructions per cycle per watt and 185.75 instructions per cycle per watt per area. Area is measured with meters squared and power in watt.
