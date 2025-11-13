!/bin/bash

# Author: Kevin Fuentes
# Program Name: r.sh
# Purpose: The purpose is to make a bash file that can compile and run the program "Non-deterministic Random Numbers".
 
echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file executive.asm"
nasm -f elf64 -o executive.o executive.asm

echo "Assemble the X86 file output_array.asm"
nasm -f elf64 -o output_array.o output_array.asm

echo "Assemble the X86 file fill_random_array.asm"
nasm -f elf64 -o fill_random_array.o fill_random_array.asm

echo "Assemble the X86 file isnan.asm"
nasm -f elf64 -o isnan.o isnan.asm

echo "Assemble the X86 file normalize.asm"
nasm -f elf64 -o normalize.o normalize.asm

echo "Assemble the X86 file getline.asm"
nasm -f elf64 -o getline.o getline.asm

echo "Assemble the X86 file printString.asm"
nasm -f elf64 -o printString.o printString.asm

echo "Assemble the X86 file atof.asm"
nasm -f elf64 -o atof.o atof.asm

echo "Assemble the X86 file ftoa.asm"
nasm -f elf64 -o ftoa.o ftoa.asm

echo "Link the all 'O' files"
ld -o go.out printString.o getline.o normalize.o isnan.o fill_random_array.o output_array.o executive.o atof.o ftoa.o

echo "Next the program ""Non-deterministic Random Numbers"" will run"
./go.out
rm *.o
echo "This bash file will now terminate."