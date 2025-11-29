;*****************************************************************************************************************************                                                      *
; Program Name: "executive.asm". This program demonstrates how to output raw binary into hexidecimal to the terminal in pure *
;                                assembly. Copyright (C) 2025  Kevin Fuentes                                                 *
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

%include "data.inc"

segment .data
    LF equ 10 ; line feed
    hex_digits db "0123456789ABCDEF"

segment .bss
    temp resb 20

segment .text
output_array:
backup
; Moving arguments into Non-violatile registers
mov r15, rdi ;array address
mov r14, rsi ;array size
mov r13, 0 ;counter
; Check if all elements have been printed
check_size:
cmp r13, r14
jge exit

output_array_loop:

mov r12, [r15+r13*8]
mov rdi, temp
mov byte [rdi], '0'
mov byte [rdi+1], 'x'

mov rsi, rdi
add rsi, 17
mov rcx, 16

hex_inner_loop:
cmp rcx, 0
jle hex_done


; Extract the top 4 bits
mov rdx, r12
shr rdx, 60
and rdx, 0xF
; Get the corresponding hex digit
mov al, [hex_digits + rdx]
mov [rsi], al
; Shift left to process the next 4 bits
shl r12, 4
dec rsi
dec rcx
jmp hex_inner_loop

hex_done:
mov byte [rdi + 18], 10
mov byte [rdi + 19], 0
mov rdi, temp
call printString
inc r13
jmp check_size

exit:
restore
ret