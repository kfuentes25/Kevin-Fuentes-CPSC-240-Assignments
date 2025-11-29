;*****************************************************************************************************************************                                                      *
; Program Name: "executive.asm". This program demonstrates how to print a string to the terminal using pure assembly.        *
;                               Copyright (C) 2025  Kevin Fuentes *
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
; Name: printString.asm
; Languages: X86, bash
; Start Date: 10-23-2025
; Completion Date: 
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================


global printString

%include "data.inc"

segment .data
LF equ 10 ; line feed
NULL equ 0 ; end of string
TRUE equ 1
FALSE equ 0
EXIT_SUCCESS equ 0 ; success code
STDIN equ 0 ; standard input
STDOUT equ 1 ; standard output
STDERR equ 2 ; standard error
SYS_read equ 0 ; read
SYS_write equ 1 ; write
SYS_open equ 2 ; file open
SYS_close equ 3 ; file close
SYS_fork equ 57 ; fork
SYS_exit equ 60 ; terminate
SYS_creat equ 85 ; file open/create
SYS_time equ 201 ; get time

;  Define some strings.
STRLEN equ 50
newLine db LF, NULL
segment .bss
segment .text

printString:
backup
; =========================================================This section of code is from the book!=========================================================
;move thing to output to rbx and rdx is character counter
mov rbx, rdi
mov rdx, 0
;end block

strCountLoop:
cmp byte [rbx], 0
je strCountDone
inc rdx
inc rbx
jmp strCountLoop
strCountDone:
; check if empty str
cmp rdx, 0
je prtDone
;end block

;  Call OS to output string.
mov rax, SYS_write ; system code for write()
mov rsi, rdi ; address of chars to write
mov rdi, STDOUT ; standard out ; RDX=count to write, set above
syscall
; =========================================================This section of code is from the book!=========================================================
prtDone:
restore
ret