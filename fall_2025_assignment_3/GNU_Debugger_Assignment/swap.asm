;*****************************************************************************************************************************
; Program Name: "swap.asm". This program demonstrates how to swap the positions of two elements in an array.                 *
; Copyright (C) 2025  Kevin Fuentes                                                                                          *
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
; version 3 as published by the Free Software Foundation.                                                                    *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      *
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.                            *
;*****************************************************************************************************************************
;
; Author Information:
; Name: Kevin Fuentes
; CWID: 885809459
; Section: CPSC 240-13
; Email: kevinfuentes0015@csu.fullerton.edu
;
; Program Information:
; Name: swap.asm
; Languages: X86, C, bash
; Start Date: 10-2-2024
; Completion Date:  10-12-2024
;
; Program's Purpose: to swap the positions of two elements in an array
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================
global swap_function

%include "data.inc"
segment .data

segment .bss

segment .text

swap_function:

; store vallue of two paraemters
movsd xmm15, [rdi]
movsd xmm14, [rsi]
;end block

; swap the values in the two registers
movsd xmm13, xmm15
movsd xmm15, xmm14
movsd xmm14, xmm13
;end block

ret

backup













































restore
;Return
ret