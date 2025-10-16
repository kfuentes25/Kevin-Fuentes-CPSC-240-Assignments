#!/bin/bash

# Author: Kevin Fuentes
# Program Name: r.sh
# Purpose: The purpose is to make a bash file that can compile and run the program "Arrays".
 
echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file manager.asm"
nasm -f elf64 -o manager.o manager.asm

echo "Assemble the X86 file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm

echo "Assemble the X86 file append.asm"
nasm -f elf64 -o append.o append.asm

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -o isfloat.o isfloat.asm

echo "Assemble the X86 file magnitude.asm"
nasm -f elf64 -o magnitude.o magnitude.asm

echo "Assemble the X86 file mean.asm"
nasm -f elf64 -o mean.o mean.asm

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Compile the C file display_array.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o display_array.o display_array.c

echo "Link the all 'O' files"
gcc -m64 -Wall -fno-pie -no-pie -o go.out main.o display_array.o manager.o input_array.o append.o isfloat.o magnitude.o mean.o 

echo "Next the program ""Arrays"" will run"
./go.out
rm *.o
echo "This bash file will now terminate."