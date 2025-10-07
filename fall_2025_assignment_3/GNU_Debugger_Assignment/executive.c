// Program Name: "GDB Learning Place". This program demonstrates how to use gdb for an assembly programmer.  Copyright (C) 2025  Kevin Fuentes

// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
// version 3 as published by the Free Software Foundation.                                                                    
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

// Author Information:
// Name: Kevin Fuentes
// CWID: 885809459
// Section: CPSC 240-#
// Email: @csu.fullerton.edu

// Program Information:
// Name: executive.c
// Languages: C
// Start Date: 10-2-2025
// Completion Date: 10-12-2025

// Program's Purpose:
// The "executive.c program" will introduce the main function which includes the beginning
// and the end of the program.

// Project Information:
// Files: main.c, sort.c, input_array.asm, isfloat.asm, manager.asm, outputarray.asm, sum.asm, swap.asm, rg.sh, r.sh, data.inc
// Developing Computer: Dell Latitude
// Status: IN PROGRESS

// Translator Information:
// GNU Compiler: gcc
// GNU Linker: gcc

// Execution:
// ./go.out
#include <stdio.h>

extern double manager();

int main() {
    printf("Weclome to GDB Learning Place\n");
    double result = manager();
    printf("The driver function received this number %.3lf and will keep it for future use\n", result);
    printf("A zero will be sent to the operating system. Bye.\n");
    
    return 0;
}