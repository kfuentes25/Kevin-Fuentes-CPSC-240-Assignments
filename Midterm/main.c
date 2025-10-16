// Kevin Fuentes
// “CPSC 240-3
// October 16, 2025
// Midterm Program
// kevinfuentes0015@csu.fullerton.edu
// 885809459

#include <stdio.h>

extern double supervisor();
extern double manager();

int main(){
    printf("Welcome to the shifting program.\n");
    double result = supervisor();
    printf("\nThe driver recieved %lf and will keep it.\n", result);
    printf("A zero will be returned to the operating system.\n");
    return 0;
}