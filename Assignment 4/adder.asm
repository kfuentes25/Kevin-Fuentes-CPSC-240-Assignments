;*****************************************************************************************************************************
; Program Name: "adder.asm". This program demonstrates how to add all the values in an array using pure assembly.            *
;                             Copyright (C) 2025  Kevin Fuentes                                                          *
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
; Name: arithmetic.asm
; Languages: X86, bash
; Start Date: 10-23-2024
; Completion Date: 
;
; Program's Purpose: to receive inputs for the contents of an array of float numbers
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================
global adder
extern ftoa
extern stringtof

%include "data.inc"

segment .data


segment .bss
current_elem resb 64

segment .text

adder:
backup
mov r15, rdi
mov r14, rsi
mov r13, 0
;end block

; Zero out xmm15
xorpd xmm15, xmm15
;end block

sum_loop:
; Check if the loop counter is at the end of the array
cmp r13, r14
jge exit
;end block

; Get pointer to current string element
mov rdi, [r15 + r13*8]
call stringtof
;end block

; Add the converted float to our running sum
addsd xmm15, xmm0
inc r13
jmp sum_loop
;end block

exit:
; Convert the sum (in xmm15) to a string
movsd xmm0, xmm15
call ftoa
mov r15, rax
;end block

restore
; Return (string pointer in rax from ftoa)
ret
