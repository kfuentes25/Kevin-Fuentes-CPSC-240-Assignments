;*************************************************************************************************************************************
; Program Name: "executive.asm". This program demonstrates its purpose as a driver for all things. Copyright (C) 2025  Kevin Fuentes *                                                          *
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
%include "data.inc"
extern output_array
extern getline
extern printString

segment .data

;First block
welcome db "Welcome to Random Products, LLC.", 10, 0
maintained_by db "This software is maintained by Albert Einstein", 10, 0

;Second block
enter_name db 10, "Please enter your name: ", 0
enter_title db "Please enter your title (Mr,Ms,Sargent,Chief,Project Leader,etc): ", 0
nice_to_meet db "Nice to meet you ", 10, 0

;Third block
will_generate db "This program will generate 64-bit IEEE float numbers.", 10, 0
how_many_nums db "How many numbers do you want.  Today’s limit is 100 per customer.", 10, 0
have_been_stored db "Your numbers have been stored in an array.  Here is that array.", 10, 10, 0

;Fourth blocks"
now_be_normalized db "The array will now be normalized to the range 1.0 to 2.0  Here is the normalized array", 10, 0
goodbye db "Good bye ", 0
you_are_welcome db "  You are welcome any time.", 10, 10, 0
return_zero db "A zero will be returned to the operating system.", 10, 10, 0

;Fifth block
ieee754_and_scientific_decimal_format db "0x%-181X%.13g", 10, 0

segment .bss
name resb 50+2
title resb 50+2
myarr resq 64
arrlength resb 1


segment .text
executive:

