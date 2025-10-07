#!/bin/bash

# Author: Kevin Fuentes
# Program Name: r.sh
# Purpose: The purpose is to make a bash file that can compile and run the program "GDB Learning Place" with the GNU Debugger
 
echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file manager.asm"
nasm -f elf64 -o manager.o manager.asm -gdwarf

echo "Assemble the X86 file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm -gdwarf

echo "Assemble the X86 file outputarray.asm"
nasm -f elf64 -o outputarray.o outputarray.asm -gdwarf

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -o isfloat.o isfloat.asm -gdwarf

echo "Assemble the X86 file sum.asm"
nasm -f elf64 -o sum.o sum.asm -gdwarf

echo "Assemble the X86 file swap.asm"
nasm -f elf64 -o swap.o swap.asm -gdwarf

echo "Compile the C file executive.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o executive.o executive.c -g

echo "Compile the C file sort.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o sort.o sort.c -g

echo "Link the all 'O' files"
gcc -m64 -Wall -fno-pie -no-pie -o go.out executive.o outputarray.o manager.o input_array.o sum.o isfloat.o swap.o sort.o -g

echo "Next the program ""GDB Learning Place"" will run"
gdb go.out