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
; Name: getline.asm
; Languages: X86, bash
; Start Date: 10-23-2024
; Completion Date: 
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================

global getline
extern printString

%include "data.inc"


section .data
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
section  .bss
chr resb 1
inLine resb STRLEN+2


section .text
getline:
backup

; Read characters from user (one at a time)
mov rbx, rdi ; rdi addr
mov r12, 0 ; char count
;end block

readCharacters:
    mov rax, SYS_read ; system code for read
    mov rdi, STDIN ; standard in
    lea rsi, byte [chr] ; address of chr
    mov rdx, 1 ; count (how many to read)
    syscall ; do syscall

    ;check if linefeed is inputted. if true, input is done.
    mov al, byte [chr] ; get character just read
    cmp al, LF ; if linefeed, input done
    je readDone
    ;end block

    ; check if max character amount is reached
    inc r12
    cmp r12, STRLEN
    jae readCharacters
    ;end block

    mov byte [rbx], al ; rdi[i] = chr
    inc rbx ; update tmpStr addr
    jmp readCharacters
readDone:
    mov byte [rbx], NULL ; add NULL termination
    mov rax, rbx
restore
ret