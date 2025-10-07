;*****************************************************************************************************************************
; Program Name;*****************************************************************************************************************************
; Program Name: "". *
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License *
; version 3 as published by the Free Software Foundation. *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. *
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>. *
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

global append

extern printf
extern scanf
extern fgets
extern stdin
extern strlen 
extern atof
extern malloc

%include "data.inc"

segment .data

segment .bss

segment .text 
append:
backup

; Start block
mov r12, rdi ; r12 = array A
mov r13, rsi ; r13 = length A #qwords
mov r14, rdx ; r14 = array B
mov r15, rcx ; r15 = length B
; end block

;Convert to units of bytes
;First for length A
mov rax, r13
mov r10, 8
mul r10 ;product is in rax
mov r13, rax
;end block

;Then for length B
mov rax, r15
mov r10, 8
mul r10
mov r15, rax

;Compute sum of bytes in A & B together
mov r8, r13
add r8, r15
; end block

; Create array C
mov rdi, r8
call malloc ;rax holds starting address of C
mov r9, rax ;r9 is new array C
;end block

; Loop copy A into first part of C
xor rbx, rbx ; index = 0
copy_A:
cmp rbx, r13
jge copy_B_setup

movsd xmm0, [r12 + rbx] ; read A
movsd [r9 + rbx], xmm0 ; write into C
add rbx, 8
jmp copy_A
;end block

;block to get B ready and aligned at the right place before it goes into C
copy_B_setup:
; ---- Copy B into C ----
mov r11, r9
add r11, r13
xor r10, r10 ; index = 0

;block to copy B into final array C
copy_B:
cmp r10, r15
jge done
movsd xmm0, [r14 + r10] ; read B
movsd [r11 + r10], xmm0 ; write into C (at offset after A)
add r10, 8
jmp copy_B
;end block
done:
mov rax, r9 ; return pointer to C

restore
ret
