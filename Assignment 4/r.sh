!/bin/bash

# Author: Kevin Fuentes
# Program Name: r.sh
# Purpose: The purpose is to make a bash file that can compile and run the program "Sum of Values in an Array".
 
echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file arithmetic.asm"
nasm -f elf64 arithmetic.asm -o arithmetic.o 

echo "Assemble the X86 file adder.asm"
nasm -f elf64 adder.asm -o adder.o

echo "Assemble the X86 file outputarray.asm"
nasm -f elf64 output_array.asm -o output_array.o

echo "Assemble the X86 file input_array.asm"
nasm -f elf64 input_array.asm -o input_array.o

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -o isfloat.o isfloat.asm

echo "Assemble the X86 file getline.asm"
nasm -f elf64 -o getline.o getline.asm

echo "Assemble the X86 file atof.asm"
nasm -f elf64 -o atof.o atof.asm


echo "Assemble the X86 file printString.asm"
nasm -f elf64 -o printString.o printString.asm

echo "Link the all 'O' files"
ld -o go.out adder.o arithmetic.o input_array.o output_array.o isfloat.o getline.o atof.o printString.o 

echo "Next the program ""Sum of Values in an Array"" will run"
./go.out
rm *.o
echo "This bash file will now terminate."