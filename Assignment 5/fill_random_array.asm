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
extern isnan0

%include "data.inc"

section .data

section .bss
temp resq 1

section .text
fill_random_array:
backup

mov r15, rdi ; the array itself
mov r14, rsi ; length of array
xor r13, r13 ; counter i = 0

capacity_check:
;check if capacity has been reached
cmp r13, r14
jge exit
;endblock

fill_array:
;generate random number with carry flag check
; rdrand rdx
; jnc fill_array
; ;endblock

; ;move random number to xmm15 for double conversion
; mov [temp], rdx
; movsd xmm0, [temp]
; ;endblock

; ;check if random number is a nan, if it is: jump to fill_array to generate a new number
; call isnan0
; cmp rax, 0
; je fill_array
; ;endblock

; ;insert the random number into the array add to array r15 at position r13, increment counter, and restart loop
; mov [r15+r13*8], rdx
; inc r13
; jmp capacity_check
; ;endblock

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
call isnan0
cmp rax, 0
je fill_array

;if number is not a nan, move into array
movsd [r15+r13*8], xmm15
    
;add to counter that a value has been added to array, then jump to check if array is still not full
inc r13
jmp capacity_check


exit:
restore
ret