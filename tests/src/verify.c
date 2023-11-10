#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

uint64_t twos_compliment(int64_t num){
    if(num < 0){
        return (~(abs(num)) +1);
    }
    else{
        return num;
    }
}

int main (int argc, char* argv[]) {

    int32_t s_op1,s_op2, t_op1, t_op2;
    int64_t s_dst, t_dst;

    FILE *sim_out, *true_out;

    if(argc == 2){
        if(strcmp(argv[1],"-h") == 0){
            printf("Usage           - ./verify sim_out.txt true_out.txt \n");
            printf("File Format     - op1 op2 rst\\n\n");
            printf("sim_out.txt     - Simulation results\n");
            printf("true_out.txt    - True output\n");
        }
        return 0;
    }
    else if(argc != 3){
        printf("Need atleast two arguments or --h \r\n");
        return 0;
    }

    
    sim_out  = fopen(argv[1], "r");
    true_out = fopen(argv[2], "r");
    
    uint8_t success = 1;

    while (!feof(sim_out)){

        fscanf(sim_out,"%d %d %ld\n",&s_op1,&s_op2,&s_dst);
        fscanf(true_out,"%d %d %ld\n",&t_op1,&t_op2,&t_dst);

        if(s_op1 != t_op1 || s_op2 != t_op2 || s_dst != t_dst){
            printf("Verification failed --- sim : %d %d %ld ; \
                true : %d %d %ld \r\n", s_op1,s_op2,s_dst,t_op1,t_op2,t_dst);
            success = 0;
            break;
        }
    }
    if(success)
        printf("Succeeded\n");

    fclose(sim_out);
    fclose(true_out);
    
    return(0);
}