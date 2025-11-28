;*************************************************************************************************************************************
; Program Name: "fill_random_array.asm". This program demonstrates how to store an array with random numbers and rejecting those that arent numbers. Copyright (C) 2025  Kevin Fuentes *
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
; version 3 as published by the Free Software Foundation.                                                                    *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
; A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;*****************************************************************************************************************************
;
; Author Information:
; Name: Kevin Fuentes
; CWID: 885809459
; Section: CPSC 240-13
; Email: kevinfuentes0015@csu.fullerton.edu
;
; Program Information:
; Name: fill_random_array.asm
; Languages: X86, bash
; Start Date: 11-12-2025
; Completion Date: 
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================

global fill_random_array
extern isnan

%include "data.inc"

section .data
section .bss

segment .text
fill_random_array:

backup

;obtain array address and size and store in nonvolatile registers
mov r15, rdi ;our array
mov r14, rsi ;number of values

;set counter to 0 to keep track of if array has been filled
mov r13, 0

;check if all space in array has been filled
check_capacity:
cmp r13, r14
jl is_less

;if array has been filled jump to exit the function
jmp exit

;jump here if array is not full yet to continue generating numbers
is_less:

;while array is not full, generate a random number into r12, push it onto the stack then move it to xmm15 to check it
fill_array:
mov rax, 0
rdrand r12
mov rdi, r12
push r12
push r12
movsd xmm15, [rsp]
pop r12
pop r12

;check if random number is a nan, if it is: jump to fill_array to generate a new number
movsd xmm0, xmm15
call isnan
cmp rax, 0
je fill_array

;if number is not a nan, move into array
movsd [r15+r13*8], xmm15
    
;add to counter that a value has been added to array, then jump to check if array is still not full
inc r13
jmp check_capacity

;exit the function when done
exit:
restore
ret
;End of the function fill_random_array ====================================================================



; section .text

; fill_random_array:
; backup

; mov r15, rdi ; the array itself
; mov r14, rsi ; length of array
; xor r13, r13 ; counter i = 0


; ;Check if r14 is 0 < r14 <=100
; cmp r14, 0
; jle exit
; cmp r14, 100
; jg exit
; ;endblock

; capacity_check:
; ;check if capacity has been reached
; cmp r13, r14
; jge exit
; ;endblock

; fill_array:
; ;generate random number with carry flag check
; rdrand r12
; jnc fill_array
; ;endblock

; ;Construct a valid normalized float from random bits IEEE 754 double format: [sign(1)] [exponent(11)] [mantissa(52)] Use random bits for mantissa, set exponent to create number in range [1.0, 2.0)
; mov r11, r12
; and r11, 0x000FFFFFFFFFFFFF
; mov r10, 0x3FF0000000000000
; or r11, r10
; ;endblock

; ;convert integer to double by pushing to stack
; push r11
; movsd xmm15, [rsp]
; add rsp, 8            ; Clean up stack properly
; ;endblock

; ;check if random number is a nan, if it is: jump to fill_array to generate a new number
; movsd xmm0, xmm15
; call isnan
; cmp rax, 0
; jne fill_array
; ;endblock

; ;insert the random number into the array add to array r15 at position r13, increment counter, and restart loop
; movsd [r15+8*r13], xmm15
; inc r13
; jmp capacity_check
; ;endblock

; exit:
; restore
; ret