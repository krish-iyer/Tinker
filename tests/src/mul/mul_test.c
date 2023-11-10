#include<stdio.h>
#include<stdlib.h>
#include<inttypes.h>

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

int main(){

    FILE *true_out;
    true_out = fopen("muls_true_out.txt", "w");
    
    int32_t a;
    int32_t b;

    for (int i=0;i<100;i++){

        a = (rand() % (MAX_NUM + 1 - MIN_NUM)) + MIN_NUM;
        b = (rand() % (MAX_NUM + 1 - MIN_NUM)) + MIN_NUM;

        fprintf(true_out,"%u %u %lu\r\n",twos_compliment(a),twos_compliment(b),twos_compliment(a*b));    
    }

    fprintf(true_out,"%u %u %lu",twos_compliment(a),twos_compliment(b),twos_compliment(a*b));    
    
    return 0;
}