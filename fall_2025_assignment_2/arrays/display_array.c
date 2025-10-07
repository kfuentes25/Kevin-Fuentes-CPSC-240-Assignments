
/********************************************************************************************************************************************************
Program Name: "". This program demonstrates
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License *
//version 3 as published by the Free Software Foundation. *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. *
//A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>. *
**********************************************************************************************************************************************************/
// Author Information:
// Name: Kevin Fuentes
// CWID: 885809459
// Section: CPSC 240-13
// Email: kevinfuentes0015@csu.fullerton.edu

// Program Information:
// Name: Amazon Wishes
// Languages: C, X86, bash
// Start Date: September 10th, 2025
// Completion Date:

// Program's Purpose:
// 

// Project Information:
// Files: main.c, display_array.c, append.asm, input_array.asm, magnitude.asm, manager.asm, mean.asm, r.sh, data.inc
// Developing Computer: Dell Lattitude
// Status: In progress

// Translator Information:
// GNU Compiler: 
// GNU Linker: 

// Execution: ./go.out
//========= Begin code area
//======================================================================================================
#include <stdio.h>

void display_array(double array[], int array_length)
{
//loop through array until each value in array has been printed for user to see
    for (int i = 0; i < array_length; i++)
    {
        printf("%lf  ", array[i]);
    }
    printf("\n");
}

