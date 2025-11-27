;*****************************************************************************************************************************                                                      *
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
intformat db 10, "%d  %d", 10, 0 
int_float dq "%18.13g",0

section .bss

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
;generate random number
mov rax, 0
rdrand r12
mov rdi, r12
push r12
push r12
movsd xmm15, [rsp]
pop r12
pop r12
;endblock

;check if rdrand is a valid random number
;;;if yes then do nothing and continue
;;;if no then generate another random number and go back to the fill_array function
;endblock
;check if random number is a nan, if it is: jump to fill_array to generate a new number
movsd xmm0, xmm15
call isnan
cmp rax, 0
je fill_array

;insert the random number into the array add to array r15 at position r13, increment counter, and restart loop
movsd [r15+r13*8], xmm15
inc r13
jmp fill_array
;endblock




exit:
restore
ret