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
; Start Date: 10-23-2025
; Completion Date: 10-31-2025
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================


global output_array
extern printString
extern ftoa

%include "data.inc"

segment .data
linefeed db 10, 0
segment .bss

segment .text

output_array:
backup

;receive the array, its size, and create an increment counter
mov r15, rdi
mov r14, rsi
xor r13, r13
;end block

begin_loop:
; compare the increment counter and array size to see if were done
cmp r13, r14
jge exit
;end block

; Save our registers before calling functions that reuse them for different things
push r15
push r14
push r13
;end block

; converts 1 floating-point number to an ASCII
movsd xmm0, [r15+8*r13]
call ftoa
;end block

; output each element in the array as ASCII strings
mov rdi, rax
call printString
;end block

;print a newline
mov rdi, linefeed
call printString
;end block

; Restore our registers with the saved values!
pop r13
pop r14
pop r15
;end block

; increments the counter
inc r13
jmp begin_loop
;end block

exit:
mov rax, r13
restore

;Return
ret