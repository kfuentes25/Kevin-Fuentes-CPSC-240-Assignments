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
extern isfloat
extern printString

%include "data.inc"

segment .data
LF equ 10 ; line feed
not_a_float db "The last input was invalid and not entered into the array", 10, 0

segment .bss
stringnum resb 64
chr resb 1
segment .text
input_array:

backup
;receive the array, its size, create an increment counter, and jump to the start of the loop
    mov r15, rdi
    mov r14, rsi
    xor r13, r13
    jmp inputloop
;end block

;block outputs that input is not floating point string and sends user back to top of the loop
try_again:
    mov rdi, not_a_float
    call printString
    jmp inputloop
;end block

inputloop:
;check if capacity has been reached
    cmp r13, r14
    jge done
;endblock

;block inputs 1 num as a string
    mov rdi, stringnum
    call getline
;endblock

;check if input is just a newline
    mov al, byte [stringnum]
    cmp al, LF
    je done
    cmp al, 0
    je done
;end block

;Validate input
    mov rdi, stringnum
    call isfloat
;end block

;jump back to send error message and restart loop
    cmp rax, 0
    je try_again
;end block

;block that converts r9 to xmm0
    mov rdi, stringnum
    call stringtof
    movsd xmm15, xmm0
;endblock

;add to array r15 at position r13
    movsd [r15+r13*8], xmm15
    inc r13
    jmp inputloop
;endblock



;done function to leave input array and return count to arithmetic
done:
    mov rax, r13
;end block
restore
ret