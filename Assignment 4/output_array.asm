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
; Name: output_array.asm
; Languages: X86, bash
; Start Date: 10-23-2024
; Completion Date: 
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================


global output_array
extern printString

%include "data.inc"

segment .data
output_format: db "%lf", 10, 0

segment .bss

segment .text

output_array:
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
call printString
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