;*****************************************************************************************************************************                                                      *
; Program Name: "normalize.asm". This program demonstrates how to normalize a hexidecimal number in pure assembly. Copyright (C) 2025  Kevin Fuentes *
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
extern printString

segment .data
mantissa_mask dq 0x000FFFFFFFFFFFFF ; Mask to clear exponent bits
norm_exp_mask dq 0x3FF0000000000000    ; Normalized exponent for 1.0


segment .bss

segment .text
normalize_array:
backup

; put the array into normal registers
mov r15, rdi
mov r14, rsi
xor r13, r13
;endblock

; Check if all things have been normalized
check_size:
cmp r13, r14
jge exit
;endblock

;make first 3 values of exponent to 000
mov r11, [r15+r13*8]
mov rax, qword [mantissa_mask]
and r11, rax
;endblock

; Set first 3 hex values to 3FF to normalize
mov rax, qword [norm_exp_mask]
or r11, rax
;endblock

; Moving the normalized value into the array and restart loop
mov [r15+r13*8], r11
inc r13
jmp check_size
;endblock

exit:
restore
ret