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
; Name: atof.asm
; Languages: X86, bash
; Start Date: 10-31-2025
; Completion Date: 10-31-2025
;
; Translator Information:
; Linux: Ubuntu
;
;===== Begin code area =======================================================================================================================


;Declarations
global stringtof

;Declare initialized data in this section
segment .data
; Constants for floating-point arithmetic.
ten       dq 10.0        ; constant 10.0 for integer accumulation
oneTenth  dq 0.1         ; constant 0.1 for fractional digit weight

;Declare uninitialized data in this section
segment .bss
 ;this section is empty

;Executable instructions in this section
segment .text

stringtof:

;Block that backs up almost all GPRs
;Back up the general purpose registers for the sole purpose of protecting the data of the caller.
push rbp                                          ;Backup rbp
mov  rbp,rsp                                      ;The base pointer now points to top of stack
push rdi                                          ;Backup rdi
push rsi                                          ;Backup rsi
push rdx                                          ;Backup rdx
push rcx                                          ;Backup rcx
push r8                                           ;Backup r8
push r9                                           ;Backup r9
push r10                                          ;Backup r10
push r11                                          ;Backup r11
push r12                                          ;Backup r12
push r13                                          ;Backup r13
push r14                                          ;Backup r14
push r15                                          ;Backup r15
push rbx                                          ;Backup rbx
pushf                                             ;Backup rflags

; Set xmm15 (the result) to 0.0
xorpd   xmm15, xmm15
; Load constant 10.0 into xmm14 and 0.1 into xmm13
movsd   xmm14, [ten]
movsd   xmm13, [oneTenth]

; Initialize sign flag (r15b will hold 0 for positive, 1 for negative)
xor     r15, r15           ; assume positive

; Check for leading sign
mov     al, byte [rdi]
cmp     al, '-'
jne     check_plus
mov     r15b, 1            ; set negative flag
add     rdi, 1             ; skip the '-'
jmp     integer_loop

check_plus:
cmp     al, '+'
jne     integer_loop       ; no sign, proceed normally
add     rdi, 1             ; skip the '+'

integer_loop:
; Load next character from string (simulate movzx)
mov     al, byte [rdi]     ; load a byte into al
and     eax, 0xFF          ; zero-extend into eax using AND
cmp     eax, 0             ; compare to null terminator
je      finish_number      ; if zero, finished
cmp     al, '.'            ; is it a decimal point?
je      fractional_process
cmp     al, '0'
jb      finish_number      ; if below '0', stop processing
cmp     al, '9'
ja      finish_number      ; if above '9', stop processing
sub     al, '0'            ; convert ASCII digit to numeric value
; (eax now holds a value between 0 and 9)
cvtsi2sd xmm12, eax         ; convert integer digit to double (in xmm12)
mulsd   xmm15, xmm14         ; result = result * 10.0
addsd   xmm15, xmm12         ; result = result + digit value
add     rdi, 1             ; move to next character (using add instead of inc)
jmp     integer_loop

;Passing decimal point after done with int
fractional_process:
add     rdi, 1             ; skip the decimal point
; Set initial fractional weight in xmm11 = 0.1
movsd   xmm11, [oneTenth]

;Process the right side of the decimal
fraction_loop:
mov     al, byte [rdi]
and     eax, 0xFF
cmp     eax, 0
je      finish_number
cmp     al, '0'
jb      finish_number
cmp     al, '9'
ja      finish_number
sub     al, '0'
cvtsi2sd xmm12, eax         ; convert digit to double
mulsd   xmm12, xmm11         ; multiply by current weight
addsd   xmm15, xmm12         ; add to result
mulsd   xmm11, xmm13         ; update weight: weight = weight * 0.1
add     rdi, 1             ; move to next character
jmp     fraction_loop


finish_number:
; Apply sign if negative
cmp     r15b, 1
jne     positive_result
xorpd   xmm12, xmm12       ; zero register
subsd   xmm12, xmm15       ; 0.0 - result = -result
movsd   xmm15, xmm12

positive_result:
;Move the float to xmm0 so it is returned to caller
movsd xmm0, xmm15

;Restore all general purpose registers to their original values
popf                                    ;Restore rflags
pop rbx                                 ;Restore rbx
pop r15                                 ;Restore r15
pop r14                                 ;Restore r14
pop r13                                 ;Restore r13
pop r12                                 ;Restore r12
pop r11                                 ;Restore r11
pop r10                                 ;Restore r10
pop r9                                  ;Restore r9
pop r8                                  ;Restore r8
pop rcx                                 ;Restore rcx
pop rdx                                 ;Restore rdx
pop rsi                                 ;Restore rsi
pop rdi                                 ;Restore rdi
pop rbp                                 ;Restore rbp

ret

;End of the function stringtof   ====================================================================