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

# echo "Assemble the X86 file outputarray.asm"
# nasm -f elf64 outputarray.asm -o outputarray.o

# echo "Assemble the X86 file input_array.asm"
# nasm -f elf64 input_array.asm -o input_array.o

# echo "Assemble the X86 file isfloat.asm"
# nasm -f elf64 -o isfloat.o isfloat.asm

echo "Link the all 'O' files"
ld -o go.out adder.o arithmetic.o 

echo "Next the program ""Sum of Values in an Array"" will run"
./go.out
rm *.o
echo "This bash file will now terminate."