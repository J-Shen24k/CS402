#include <stdio.h>
#include <stdlib.h>
#include "readfile.h"
#include <math.h>
FILE*f;
int main(int argc, char** argv) {
    if (argc >= 2) {
        char *filename = argv[1];
        int ret = open_file(argv[1]);
        if (ret != 0) {
            printf("Cannot open file %s!\n", filename);
            return -1;
        }
    }
    f = fopen(argv[1],"r");
    int count = 1;
    char c;
    for (c = getc(f); c != EOF; c = getc(f))
        if (c == '\n') // Increment count if this character is newline
            count = count + 1;
//    printf("%d\n",count);
    fclose(f);
    f = fopen(argv[1],"r");
    int n = 20;
    while(n<count){
        n = n*2;
    }
    float *ptr1 = (float *)malloc(n*sizeof(float));
    int i=0;

    if(f != NULL) {
        while (!feof(f) ) {
            fscanf(f, "%f",&ptr1[i]);
            i++;
        }
    }
    else{
        perror("FP ERROR: ");
        printf("sndskadasd");
    }
    fclose(f);
    float sum;
    float temp;
    float median;
    float mean;
    for (int m= 0; m<count; m++){
        for (int o= m+1; o<count; o++){
            if (ptr1[m]>ptr1[o]){
                temp = ptr1[m];
                ptr1[m] = ptr1[o];
                ptr1[o] = temp;
            }
        }
    }
    for (int j=0; j<count; j++){
        sum = sum + ptr1[j];
//        printf("%f\n",ptr1[j]);
    }
    mean = sum/count;
    float cyt;
    float total=0;
    float stddev;
    for (int u=0; u<count; u++){
        cyt = pow((ptr1[u]-mean),2);
//        printf("%f\n",cyt);
        total = total + cyt;
//        printf("%f\n",total);
    }
//    printf("%f\n",total);
    stddev = sqrtf(total/count);
    if (count%2==0){
//        printf("%f\n",ptr1[count/2 -1]);
//        printf("%f\n",ptr1[count/2]);
        median = (ptr1[count/2 -1] + ptr1[count/2])/2;

    }
    else{
        median = ptr1[(count-1)/2];
    }
    printf("Results:\n");
    printf("--------\n");
    printf("Num vakues:");
    printf("            %d\n",count);
    printf("mean:");
    printf("                  %f\n",mean);
    printf("median:");
    printf("                %f\n",median);
    printf("stddev:");
    printf("                %f\n",stddev);
    printf("Unused array capacity:");
    printf(" %d\n",n-count);

}
