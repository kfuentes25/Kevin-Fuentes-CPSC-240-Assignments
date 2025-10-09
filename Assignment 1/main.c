/********************************************************************************************************************************************************
Program Name: "Amazon Wishes". This program demonstrates how to input and output a float with scanf. How to calculate products using operands.
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
**********************************************************************************************************************************************************/
// Author Information:
// Name: Kevin Fuentes
// CWID: 885809459
// Section: CPSC 240-13
// Email: kevinfuentes0015@csu.fullerton.edu

// Program Information:
// Name: Amazon Wishes
// Languages: C, X86, bash
// Start Date: August 27th, 2025
// Completion Date:

// Program's Purpose:
// This program will serve to help users calculate how much time they spent driving and their average speed
// speed during their drive

// Project Information:
// Files: main.cpp, amazonwishes.asm, delivery_script.sh
// Developing Computer: Dell Latitude
// Status: Complete

// Translator Information:
//      GNU Compiler: gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c
//      GNU Linker: gcc -m64 -Wall -fno-pie -no-pie -o go.out main.o amazonwishes.o  

// Execution: ./go.out
//========= Begin code area
//======================================================================================================


#include <stdio.h>

extern double express_delivery();

int main(int argc, char* argv[]) {
    printf("\nWelcome to the Amazon Wishes Delivery Service\n");

    double result = express_delivery();

    printf("\n\nThe driver received this number %.2f and will keep it for future use.\n\n", result);

    printf("Thank you for using out software. Have a nice day.\n");
    
    printf("An integer zero will be returned to the operating system.\n\n");
    return 0;
} 