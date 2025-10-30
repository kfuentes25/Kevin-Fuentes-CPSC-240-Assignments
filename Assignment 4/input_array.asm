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
; Name: input_array.asm
; Languages: X86, bash
; Start Date: 10-23-2024
; Completion Date: 
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================


global input_array
extern getline
extern stringtof
%include "data.inc"

segment .data
segment .bss
stringnum resq 100
segment .text
input_array:



;Input Array starts
mov r15, rdi
mov r14, rsi
xor r13, r13

inputloop:
;check for ctrl+D
cdqe
cmp rax, 0
je done
; end block

;check if capacity has been reached
    cmp r13, r14
    jge done
    jmp inputloop
;endblock

;block inputs 1 num as a string
    mov rdi, stringnum
    mov rsi, 40
    call getline
;endblock

;block that converts stringnum to xmm0
    mov rdi, stringnum
    call stringtof
;endblock

;add to array r15 at position r13
    movsd [r15+8*r13], xmm0
    inc r13
    jmp inputloop
;endblock
done:
mov rax, r13

;End input Array