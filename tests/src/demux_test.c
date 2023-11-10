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
        printf("Usage           - ./demux_test true_out.txt \n");
        printf("File Format     - in ctrl out1 out2 out3 out4\\n\n");
        return 0;
    }

    true_out = fopen(argv[1], "w");
    
    
    int32_t in;
    int32_t ctrl;

    for (int i=0;i<100;i++){

        in = (rand() % (MAX_NUM + 1 - MIN_NUM)) + MIN_NUM;

        for(int j=0;j<4;j++){
            int32_t out[4] = {0,0,0,0};
            out[j] = in;
            fprintf(true_out,"%lu %lu %lu %lu %lu %lu\n",twos_compliment(in),twos_compliment(j),twos_compliment(out[0]),twos_compliment(out[1]),twos_compliment(out[2]),twos_compliment(out[3]));    
        }
    }
    
    return 0;
}