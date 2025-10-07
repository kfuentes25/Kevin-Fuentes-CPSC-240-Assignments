;*****************************************************************************************************************************
; ; Program Name: "manager.asm". This program demonstrates how to manage all functions of this program and is one of the main drives along with the C file.  Copyright (C) 2025  Kevin Fuentes

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.
;*****************************************************************************************************************************
;
; Author Information:
; Name: Kevin Fuentes
; CWID: 885809459
; Section: CPSC 240-13
; Email: kevinfuentes0015@csu.fullerton.edu
;
; Program Information:
; Name: manager.asm
; Languages: X86, C, bash
; Start Date: 10-2-2024
; Completion Date:  10-12-2024
;
; Program's Purpose: to manage all functions of this program and is one of the main drives along with the C file
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================
global manager
extern printf
extern fgets
extern stdin
extern strlen
extern atof
extern clearerr
extern input_array
extern outputarray
extern sum_function
extern sort


%include "data.inc"


; segment .data IS WHERE INITIALIZED DATA IS DECLARED
segment .data
prompt_name db "Please enter your name: ", 0
output_name db "Thank you %s", 0
prompt_occupation db "Please enter your future occupation: ", 0
output_occupation db "Thank you. We like %s.", 0
prompt_float_nums db "Please enter float numbers separated by ws. Press enter followed by cont-d to terminate.", 10, 0
prompt_nums_entered db "Thank you. You entered these numbers: ", 10, 0
prompt_sum db "The sum of this array is %lf", 10, 0
prompt_sorting_array db "The array will now be sorted.", 10, 0
prompt_sorted db "These are the current values in the array: ", 10, 0
prompt_program_will_terminate db "This program will terminate.", 10, 0
prompt_have_a_nice_day db "Have a nice day %s", 0
prompt_invite db "Invite a %s to come with you next time.", 10, 0

string_format db "%s", 0
float_format db "%lf", 0
sum_result dq 0.0
array_size db 0

segment .bss
align 64
myarr resq 64
name resb 64
occupation resb 64

segment .text
manager:
backup
; This block outputs prompt_name message
mov rax, 0
mov rdi, prompt_name
call printf
;end block

; This block accepts the input from keyboard for the name and places it into "name"
mov rax, 0
mov rdi, name
mov rsi, 63
mov rdx, [stdin]
call fgets
; end block

;this block outputs output_name message
mov rax, 0
mov rdi, output_name
mov rsi, name
call printf
;end block

; This block outputs prompt_occupation message
mov rax, 0
mov rdi, prompt_occupation
call printf
;end block

; This block accepts the input from keyboard for the occupation and places it into "occupation"
mov rax, 0
mov rdi, occupation
mov rsi, 63
mov rdx, [stdin]
call fgets
; end block

;this block outputs output_occupation message
mov rax, 0
mov rdi, output_occupation
mov rsi, occupation
call printf
;end block

;this block outputs prompt_float_nums message
mov rax, 0
mov rdi, prompt_float_nums
call printf
;end block

; this block calls the input array function
mov rax, 0
mov rdi, myarr
mov rsi, 63
call input_array
;end block

; copy the size of the array from rax to r11
mov [array_size], rax
;end block

; this block outputs prompt_nums_entered
mov rax, 0
mov rdi, prompt_nums_entered
call printf
;end block

; this block calls the outputarray function
mov rax, 0
mov rdi, myarr
mov rsi, [array_size]
call outputarray
;end block

; block to call sum function and calculate sum of elements in array
mov rax, 0
mov rdi, myarr
mov rsi, [array_size]
call sum_function
;end block

; store the sum in sum_result 
movsd [sum_result], xmm0
;end block

; block to output prompt_sum message and sum together
mov rax, 1
mov rdi, prompt_sum
movsd xmm0, [sum_result]
call printf
;end block

; block to output prompt_sorting_array
mov rax, 0
mov rdi, prompt_sorting_array
call printf
;end block

; block to call sum function and calculate sum of elements in array
mov rdi, myarr
mov rsi, [array_size]
call sort
; end block

; block to output prompt_sorted
mov rax, 0
mov rdi, prompt_sorted
call printf
;end block

; this block calls the outputarray function
mov rax, 0
mov rdi, myarr
mov rsi, [array_size]
call outputarray
;end block

; output the prompt_program_will_terminate message
mov rax, 0
mov rdi, prompt_program_will_terminate
call printf
;end block

; output the prompt_have_a_nice_day message
mov rax, 0
mov rdi, prompt_have_a_nice_day
mov rsi, name
call printf
;end block

; output the prompt_invite message
mov rax, 0
mov rdi, prompt_invite
mov rsi, occupation
call printf
;end block

; return the sum result to the driver
movsd xmm0, [sum_result]
;end block

restore
;Return
ret