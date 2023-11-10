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


    if(argc == 2){
        if(strcmp(argv[1],"-h") == 0){
            printf("Usage           - ./verify 3 sim_out.txt true_out.txt \n");
            printf("File Format     - op1 op2 rst\\n\n");
            printf("sim_out.txt     - Simulation results\n");
            printf("true_out.txt    - True output\n");
        }
        return 0;
    }
    else if(argc != 4){
        printf("Need atleast two arguments or --h \r\n");
        return 0;
    }


    int row = atoi(argv[1]);
    int32_t s_in[row], t_in[row];
    int64_t s_dst, t_dst;

    FILE *sim_out, *true_out;


    sim_out  = fopen(argv[2], "r");
    true_out = fopen(argv[3], "r");
    
    uint8_t success = 1;
    uint64_t count_test = 0;

    while (!feof(sim_out)){

        for(int i=0;i<row;i++){
            fscanf(sim_out,"%d",&s_in[i]);
            fscanf(true_out,"%d",&t_in[i]);
        }
        fscanf(sim_out,"\n");
        fscanf(true_out,"\n");
    
        for(int i=0;i<row;i++){
            if(s_in[i] != t_in[i]){
                printf("Verification failed (success %ld) --- sim : ",count_test);
                for (int j = 0; j < row; j++)
                {
                    printf("%d ",s_in[j]);
                }
                printf("true: ");
                for (int j = 0; j < row; j++)
                {
                    printf("%d ",t_in[j]);
                }
                printf("\n");                
                success = 0;
                break;
            }
        }
        count_test += 1;
    }
    if(success)
        printf("Succeeded tests : %ld\n",count_test);

    fclose(sim_out);
    fclose(true_out);
    
    return(0);
}