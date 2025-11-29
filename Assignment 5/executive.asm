;*************************************************************************************************************************************
; Program Name: "executive.asm". This program demonstrates its purpose as a driver for all things. Copyright (C) 2025  Kevin Fuentes *
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License          *
; version 3 as published by the Free Software Foundation.                                                                            *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied                 *
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.             *
; A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                                   *
;*************************************************************************************************************************************
;
; Author Information:
; Name: Kevin Fuentes
; CWID: 885809459
; Section: CPSC 240-13
; Email: kevinfuentes0015@csu.fullerton.edu
;
; Program Information:
; Name: arithmetic.asm
; Languages: X86, bash
; Start Date: 11-12-2025
; Completion Date: 
;
; Program's Purpose: to 
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================
global _start

extern output_array
extern getline
extern printString
extern atolong
extern normalize_array
extern fill_random_array
%include "data.inc"


segment .data
STRLEN equ 50
LF equ 10



;First block
welcome db "Welcome to Random Products, LLC.", 10, 0
maintained_by db "This software is maintained by Albert Einstein", 10, 0

;Second block
enter_name db 10, "Please enter your name: ", 0
enter_title db "Please enter your title (Mr,Ms,Sargent,Chief,Project Leader,etc): ", 0
nice_to_meet db "Nice to meet you ", 0

;Third block
will_generate db "This program will generate 64-bit IEEE float numbers.", 10, 0
how_many_nums db "How many numbers do you want.  Today’s limit is 100 per customer.   ", 0
have_been_stored db "Your numbers have been stored in an array.  Here is that array.", 10, 10, 0

;Fourth blocks"
now_be_normalized db "The array will now be normalized to the range 1.0 to 2.0  Here is the normalized array", 10, 10, 0
goodbye db "Good bye ", 0
you_are_welcome db ". You are welcome any time.", 10, 0
return_zero db "A zero will be returned to the operating system.", 10, 10, 0

IEEE754 db "IEEE754", 10, 0

;Fifth block
newLine db LF, 0

segment .bss
name resb 50+2
title resb 50+2

myarr resq 101
arrlength_str resb 50+2
arrlength resq 1


segment .text
_start:
backup

; First, print welcome message
mov rax, 0
mov rdi, welcome
mov rsi, STRLEN
call printString
;endblock

;print maintained by message
mov rax, 0
mov rdi, maintained_by
mov rsi, STRLEN
call printString
;endblock

;prompt user for name
mov rdi, enter_name
mov rsi, STRLEN
call printString
;endblock

;get user name
mov rax, 0
mov rdi, name
call getline
;endblock

;prompt user for title
mov rdi, enter_title
mov rsi, STRLEN
call printString
;endblock

;get user title
mov rax, 0
mov rdi, title
call getline
;endblock

;greet user
mov rax, 0
mov rdi, nice_to_meet
call printString

mov rax, 0
mov rdi, name
call printString
;endblock

;print newlines to keep with formatting
mov rdi, newLine
call printString
mov rdi, newLine
call printString
;endblock

;print message about generating numbers
mov rax, 0
mov rdi, will_generate
mov rsi, STRLEN
call printString
;endblock

;prompt user for how many numbers to generate
mov rax, 0
mov rdi, how_many_nums
mov rsi, STRLEN
call printString
;endblock

;get user input for how many numbers to generate
mov rdi, arrlength_str
call getline
;endblock

;convert user input string to integer
mov rdi, arrlength_str
call atolong
mov [arrlength], rax
;endblock

;print your numbers have been stored message
mov rax, 0
mov rdi, have_been_stored
mov rsi, STRLEN
call printString
;endblock

;generate random numbers and store in array
mov rax, 0
mov rdi, myarr
mov rsi, [arrlength]
call fill_random_array
;endblock

;print IEEE754 header
mov rax, 0
mov rdi, IEEE754
call printString
;endblock

;output the array of random numbers
mov rdi, myarr
mov rsi, [arrlength]
call output_array
;endblock

;print newlines to keep with formatting
mov rdi, newLine
call printString
;endblock

;print that the array will now be normalized
mov rax, 0
mov rdi, now_be_normalized
mov rsi, STRLEN
call printString
;endblock

;normalize the array
mov rax, 0
mov rdi, myarr
mov rsi, [arrlength]
call normalize_array
;endblock

;print IEEE754 header
mov rax, 0
mov rdi, IEEE754
call printString
;endblock

;output the array of random numbers
mov rdi, myarr
mov rsi, [arrlength]
call output_array
;endblock

;print newlines to keep with formatting
mov rdi, newLine
call printString
;endblock

; print series of goodbye messages
    ;print goodbye message
    mov rax, 0
    mov rdi, goodbye
    call printString
    ;endblock

    ;print user title again
    mov rax, 0
    mov rdi, title
    call printString
    ;endblock

    ;print you are welcome message
    mov rax, 0
    mov rdi, you_are_welcome
    mov rsi, STRLEN
    call printString
    ;endblock

    ;print last line
    mov rax, 0
    mov rdi, return_zero
    mov rsi, STRLEN
    call printString
    ;endblock
;endblock

;restore all gprs
restore

;exit program
mov rax, 60
mov rdi, 0
syscall
ret
;endblock