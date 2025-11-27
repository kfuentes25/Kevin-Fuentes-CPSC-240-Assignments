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
; Name: normalize.asm
; Languages: X86, bash
; Start Date: 11-12-2025
; Completion Date: 
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================

global normalize_array
%include "data.inc"
segment .data                 ;Place initialized data here

segment .bss      ;Declare pointers to un-initialized space in this segment.

segment .text
normalize_array:
backup

; Moving arguments into Non-violatile registers
mov r12, rdi ;our array
mov r13, rsi ;number of values 

; Create counter for loop
mov r14, 0

; Check if numbers have been normalized
check_size:
cmp r14, r13
jl normalize_loop

; Jump to exit if done
jmp exit

; Normalize loop if array has not been fully normalized
normalize_loop:

; Move number from array to stack to r12 to change the stored exp to 3ff.
movsd xmm15, [r12 + r14 * 8]
push qword 0
movsd [rsp], xmm15
pop r15
shl r15, 12
shr r15, 12
mov rax, 0x3ff0000000000000
or r15, rax

push r15
movsd xmm15, [rsp]
pop r15

; Moving Normalized value into the array
movsd [r12+r14*8], xmm15
  
; Increases counter after loop ends
inc r14
jmp check_size


exit:
restore
ret