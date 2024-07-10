Building a Tinker Processor

Contributors:
1. Krishnan Iyer
2. Achref Rebai
3. Mojtaba AlShams

The team built a pipelined archeticture as shown on the below diagram.

![microarchitecture_diagram](https://github.com/krish-iyer/Tinker/assets/111680200/ca1ce821-30f2-41eb-a539-536ebe15c88e)


The instruction, assuming no bubbles, takes 4 cycles to finish. After it is fetched, it will go through the register stage, then the execution stage, and finally the memory stage. The [decoder](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/decoder.v) decodes the instruction to produce the correct control bits in the control register. Then it moves into the [register stage](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/reg_stage.v) where the needed registers will be accessed and their contents fed to the next stages. Next, the [execution stage](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/exec_stage.v) will execute the arithmetic operation, if requested, or just pass it to the memory stage. Finally, the [memory stage](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sources_1/new/mem_stage.v) accesses the memory, if necessary, and feeds back data to the register stage.

We followed [this instruction format](https://github.com/krish-iyer/Tinker/wiki/Specifications#instruction-format) as provided in the "instruction manual." Referring to it, the following instructions have already been tested on the microarchitecture: add, sub, and, or, xor, not, shftr, shftl, and mov. These instructions were processed with the control signals as described [here](https://github.com/krish-iyer/Tinker/wiki/Specifications#control-register).


The tests can be reproduced using [this veriog testbench](https://github.com/krish-iyer/Tinker/blob/processor/tinker.srcs/sim_1/new/arithmetic_operations_testing.v). A screenshot of the test is below and its results is shown after it.
![test code](https://github.com/krish-iyer/Tinker/assets/111680200/503451c1-8a87-4910-b68a-e6ae5ce8baf0)

![test results](https://github.com/krish-iyer/Tinker/assets/111680200/ed79a4f1-dee1-4972-a4cc-6f276f6da358)

The following devices were used to build the processor: Adder, Shifter, Logic, Two’s Complement, Register File, Multiplexer, Control Array(m x n), Add4, Register and Data Memory (i.e. Register). The summary of thier area and power consumption is shown in the below table.
![processor area and power](https://github.com/krish-iyer/Tinker/assets/111680200/92866012-c139-40e9-8999-a5d1b9987ec2)

It can be seen from the table that the total area of the processor is 128552nm2 and it consumes 33.5W. Running the program which was tested on the testbench yielded 0.8 which corresponds to 0.0239 instructions per cycle per watt and 185.75 instructions per cycle per watt per area. Area is measured with meters squared and power in watt.
