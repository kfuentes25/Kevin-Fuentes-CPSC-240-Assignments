; Kevin Fuentes
; “CPSC 240-3
; October 16, 2025
; Midterm Program
; kevinfuentes0015@csu.fullerton.edu
; 885809459
global shift_function
extern printf
extern fgets
extern stdin
extern strlen
extern atof
extern input_array
extern outputarray

%include "data.inc"

segment .data

segment .bss

segment .text
shift_function:
backup

mov r15, rdi ;the array
mov r14, rsi ;the array length
mov r13, 0 ;counter
jmp shift_loop

shift_loop:
; compare the increment counter and array size to see if were done
cmp r13, r14
jge exit
;end block

;
movsd xmm15, [r15+r13*8+8]
movsd [r15+r13*8], xmm15
inc r13
jmp shift_loop


exit:
dec r13
mov rax, r13

restore
;Return
ret