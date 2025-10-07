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
global mean
extern printf
extern scanf
extern fgets
extern stdin
extern strlen 
extern atof

%include "data.inc"

segment .data

segment .bss
align 64
segment .text

mean:
backup
; make sure that the register is empty
xorpd xmm14, xmm14 

mov r12, rdi ;r12 is the array
mov r13, rsi ;r13 is the maximum array size (8bytes each)
mov r15, 0 ;r15 is the loop counter

sum_mean:
cmp r15, r13 ;check if the loop counter is at the end of the array
jge finish ; jump to end

movsd xmm13, [r12+r15*8] ; go to next element of the array
addsd xmm14, xmm13 ;adds what is in xmm15 to what is in xmm14
inc r15
jmp sum_mean
;end block

finish:
cvtsi2sd xmm13, r13
divsd xmm14, xmm13
movsd xmm0, xmm14

restore

; Return
ret