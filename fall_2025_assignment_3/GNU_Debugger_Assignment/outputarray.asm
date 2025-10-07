;*****************************************************************************************************************************
; ; Program Name: "outputarray.asm". This program demonstrates to output the contents of an array of numbers.  Copyright (C) 2025  Kevin Fuentes

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.
;*****************************************************************************************************************************
;
; Author Information:
; Name: Kevin Fuentes
; CWID: 885809459
; Section: CPSC 240-13
; Email: kevinfuentes0015@csu.fullerton.edu
;
; Program Information:
; Name: outputarray.asm
; Languages: X86, C, bash
; Start Date: 10-2-2024
; Completion Date:  10-12-2024
;
; Program's Purpose: to output the contents of an array of float numbers
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================

global outputarray
extern printf
extern fgets
extern stdin

%include "data.inc"

segment .data
output_format: db "%lf", 10, 0

segment .bss

segment .text

outputarray:
backup

;receive the array, its size, and create an increment counter
mov r15, rdi
mov r14, rsi
mov r13, 0
;end block

begin_loop:
; compare the increment counter and array size to see if were done
cmp r13, r14
jge exit
;end block

; Outputs 1 floating-point number
mov rax, 1
mov rdi, output_format
movsd xmm0, [r15+r13*8]
call printf
;end block

; increments the counter
inc r13
jmp begin_loop
;end block

exit:
mov r13, rax
restore
;Return
ret