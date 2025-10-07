;*****************************************************************************************************************************
; Program Name: "".                                                                                  *
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
; Name: 
; Languages: X86, C, bash
; Start Date: 
; Completion Date: 
;
; Program's Purpose: 
;
; Project Information:
; Files: 
; Developing Computer: 
; Status: In progress
;
; Translator Information:
; Linux:
;
;===== Begin code area =======================================================================================================================

global input_array
extern printf
extern fgets
extern stdin
extern strlen 
extern atof
extern isfloat
extern getchar
extern EOF
extern NULL

%include "data.inc"


segment .data                 ;Place initialized data here  
floatformat db "%s", 0
not_a_float db "The last input was invalid and not entered into the array", 10, 0

segment .bss
align 64
storage resq 64

segment .text
input_array:

backup

mov r12, rdi ;r12 is the array
mov r13, rsi ;r13 is the maximum array size (8 bytes each)
mov r15, 0 ;r15 is the count of inputs and is the loop counter
jmp beginloop ;Jumps to the marker beginloop
;endblock

;block outputs that input is not floating point string and sends user back to top of the loop
try_again:
mov rax, 0
mov rdi, not_a_float
call printf
jmp beginloop
;end block

beginloop:
;Block to obtain floating point number from keyboard
mov rax, 0
mov rdi, storage
mov rsi, 64
mov rdx, [stdin]
call fgets
;end block

; Check if the user does Control+D
cdqe
cmp rax, 0
je exit ;je is jump if equal
;end block


;removes the new line character
mov rax, 0
mov rdi, storage
call strlen
mov [storage+rax-1], byte 0
;end block

;Validate input
mov rdi, storage
call isfloat
;End block: boolean answer incoming rax == 0 is false rax == non-zero is true
cmp rax, 0
je try_again
;end block

;convert string to floating value after checking its valid
mov rax, 0
mov rdi, storage
call atof
movsd xmm15, xmm0
;end block

; copy xmm15 (has value of xmm0) into array
movsd [r12+r15*8], xmm15
inc r15
jmp beginloop
;end block



;exit function to leave input array
exit:
mov rax, r15
;end block

restore
; Return
ret