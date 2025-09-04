#!/bin/bash

# Author: Kevin Fuentes
# Program Name: run.sh
# Purpose: The purpose is to make a bash file that can compile and run the program "Amazon Wishes".
 
echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file amazonwishes.asm"
nasm -f elf64 -o amazonwishes.o amazonwishes.asm

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the two 'O' files main.o amazonwishes.o"
gcc -m64 -Wall -fno-pie -no-pie -o go.out main.o amazonwishes.o  

echo "Next the program ""Amazon Wishes"" will run"
./go.out
echo "This bash file will now terminate."