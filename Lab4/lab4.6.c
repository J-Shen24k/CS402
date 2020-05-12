#include <stdio.h> 
int ack(int m, int n) 
{ 
    if (m == 0){ 
        return n+1; 
    } 
    else if((m > 0) && (n == 0)){ 
        return ack(m-1, 1); 
    } 
    else if ((m > 0) && (n > 0)){ 
        return ack(m-1, ack(m, n-1)); 
    } 
    else{
    	return 0;
    }
} 
  
int main(){ 
    int A;
    int a; 
    printf("Enter the integer: "); 
    scanf("%d", &a);
    int b; 
    printf("Enter the integer: "); 
    scanf("%d", &b); 
    A = ack(a, b); 
    printf("%d\n", A); 
    return 0; 
} 