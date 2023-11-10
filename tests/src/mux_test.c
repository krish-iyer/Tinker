#include<stdio.h>
#include<stdlib.h>
#include<inttypes.h>
#include <string.h>

#define MIN_NUM -5
#define MAX_NUM 5

uint64_t twos_compliment(int64_t num){
    if(num < 0){
        return (~(abs(num)) +1);
    }
    else{
        return num;
    }
}

int main(int argc, char* argv[]){

    FILE *true_out;

    if(argc != 2){
        printf("Error, need one argument \n");
        return 0;
    }
    else if(strcmp(argv[1],"-h") == 0){
        printf("Usage           - ./mux_test true_out.txt \n");
        printf("File Format     - in1 in2 in3 in4 ctrl out\\n\n");
        return 0;
    }

    true_out = fopen(argv[1], "w");
    
    int32_t in[4];
    int32_t ctrl;

    for (int i=0;i<100;i++){

        in[0] = (rand() % (MAX_NUM + 1 - MIN_NUM)) + MIN_NUM;
        in[1] = (rand() % (MAX_NUM + 1 - MIN_NUM)) + MIN_NUM;
        in[2] = (rand() % (MAX_NUM + 1 - MIN_NUM)) + MIN_NUM;
        in[3] = (rand() % (MAX_NUM + 1 - MIN_NUM)) + MIN_NUM;

        for(int j=0;j<4;j++) 
            fprintf(true_out,"%lu %lu %lu %lu %u %lu\r\n",twos_compliment(in[0]),twos_compliment(in[1]),twos_compliment(in[2]),twos_compliment(in[3]),twos_compliment(j),twos_compliment(in[j]));    
    }
    
    return 0;
}