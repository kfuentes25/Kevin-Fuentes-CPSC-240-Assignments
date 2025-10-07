// Program Name: "Sort_array" this program demonstrates how to sort an array in C.  Copyright (C) 2025  Kevin Fuentes

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
// Name: sort.c
// Languages: C
// Start Date: 10-2-2025
// Completion Date: 10-12-2025

// Program's Purpose:
// The "sort.c program" will introduce the sort function that will sort the array of floating-point numbers
// in order of least to greatest.

// Translator Information:
// GNU Compiler: gcc
// GNU Linker: gcc

// Execution:
// ./go.out

#include <stdbool.h>
#include <stdio.h>

void swap(double* xp, double* yp){
    double temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void sort(double arr[], int n){
    int i, j;
    bool swapped;
    for (i = 0; i < n - 1; i++) {
        swapped = false;
        for (j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(&arr[j], &arr[j + 1]);
                swapped = true;
            }
        }
        if (swapped == false)
            break;
    }
}
