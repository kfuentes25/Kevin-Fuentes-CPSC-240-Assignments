;*****************************************************************************************************************************
; Program Name: "arithmetic.asm". This program demonstrates its purpose as a driver for all things.                          *
;                                 Copyright (C) 2025  Kevin Fuentes                                                          *
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
; Name: arithmetic.asm
; Languages: X86, bash
; Start Date: 10-23-2024
; Completion Date: 
;
; Program's Purpose: to receive inputs for the contents of an array of float numbers
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================


global _start
extern input_array
extern outputarray
extern getline
extern printString

%include "data.inc"

segment .data
LF equ 10 ; line feed
NULL equ 0 ; end of string
TRUE equ 1
FALSE equ 0
EXIT_SUCCESS equ 0 ; success code
STDIN equ 0 ; standard input
STDOUT equ 1 ; standard output
SYS_read equ 0 ; read
SYS_write equ 1 ; write
SYS_exit equ 60 ; terminate

welcome_msg db "Welcome.   Please enter your name: ", 0
input_nums_msg db 10, "Please enter some float numbers each one separated by a press of the enter key..  Terminate the inputs by entering crtl+D", 10, 0
thank_you_msg db 10, "Thank you.  You entered", 10, 0
the_sum_is db 10, "The sum is: ", 0
have_a_nice_day db 10, "Have a nice day, ", 0
newLine db LF, 0

segment .bss
chr resb 1
name resb 50+2
myarr resq 64
arrlength resb 1

segment .text


_start:
backup

; Block to to output the string welcome_msg
mov rdi, welcome_msg
call printString
;endblock

;recieve input for the name
mov rdi, name
call getline
;end block

; Block to to output the string input_nums_msg
mov rdi, input_nums_msg
call printString
;endblock

; call input array
mov rdi, myarr
mov rsi, 63
call input_array
; end block


; Block to to output the string thank_you_msg
mov rdi, thank_you_msg
call printString
;endblock


;call output array

;endblock

; print out end msg
mov rdi, have_a_nice_day
call printString
;end block

;output name
mov rdi, name
call printString
;end block

;print new line "\n"
mov rdi, newLine
call printString
;end block

;terminate
mov rax, 60
mov rdi, 0
syscall
;end block

restore
ret