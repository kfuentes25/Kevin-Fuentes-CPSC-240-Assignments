#!/bin/bash

# Author: Kevin Fuentes
# Program Name: r.sh
# Purpose: The purpose is to make a bash file that can compile and run the program "GDB Learning Place".
 
echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file supervisor.asm"
nasm -f elf64 -o supervisor.o supervisor.asm

echo "Assemble the X86 file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm

echo "Assemble the X86 file outputarray.asm"
nasm -f elf64 -o outputarray.o outputarray.asm

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -o isfloat.o isfloat.asm

echo "Assemble the X86 file shift.asm"
nasm -f elf64 -o shift.o shift.asm

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the all 'O' files"
gcc -m64 -Wall -fno-pie -no-pie -o go.out supervisor.o main.o outputarray.o input_array.o isfloat.o shift.o 

./go.out
rm *.o
echo "This bash file will now terminate."