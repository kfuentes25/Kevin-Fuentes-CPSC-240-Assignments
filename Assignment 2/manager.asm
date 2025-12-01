;*****************************************************************************************************************************
; Program Name: "Manager".                                                                                  *
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
; Name: Manager
; Languages: X86, C, bash
; Start Date: 
; Completion Date: 
;
; Purpose: This program manages the arrays of 64-bit floats.
;
; Project Information:
; Files: 
; Developing Computer: 
; Status: In progress
;
; Translator Information:
; Linux:
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
extern display_array
extern magnitude
extern append
extern mean


%include "data.inc"


; segment .data IS WHERE INITIALIZED DATA IS DECLARED
segment .data

; INTRODUCTORY STATEMENTS
message_1A db "This program will manage your arrays of 64 bit floats", 10, 0
message_2A db "For array A enter a sequence of 64-bit floats separated by white space.", 10, 0
message_3A db "After the last input press enter followed by Control+D: ", 10, 0

confirm_recieved_A db 10, "These numbers were recieved and placed into array A:", 10, 0
magnitude_A db "The magnitude of array A is ", 0

message_1B db 10, 10, "For array B enter a sequence of 64-bit floats separated by white space.", 10, 0
message_2B db "After the last input press enter followed by Control+D: ", 10, 0

confirm_recieved_B db "These numbers were recieved and placed into array B:", 10, 0
magnitude_B db "The magnitude of array B is ", 0

appended_message db 10, 10, "Arrays A and B have been appended and given the name A⊕ B", 10, 0
contains_message db "A⊕ B contains:", 10, 0 

magnitude_AB db 10, "The magnitude of A⊕ B is ", 0
mean_AB db 10, 10, "The mean of A⊕ B is ", 0

; FORMATTING STATEMENTS
string_format db "%s", 0
float_format db "%lf", 0

segment .bss
align 64
myarrA resq 64
myarrB resq 64
myarrC resq 64
length_a resq 1
length_b resq 1

magnitude_C resq 1

segment .text
manager:
backup

    ; output message_1A
    mov rax, 0
    mov rdi, message_1A
    call printf

    ; output message_2A
    mov rax, 0
    mov rdi, message_2A
    call printf

    ; output message_3A
    mov rax, 0
    mov rdi, message_3A
    call printf

    ; call input array to recieve the array
    mov rax, 0
    mov rdi, myarrA
    mov rsi, 63
    call input_array
    ;end block

    ;copy the size of the array from rax into length_a
    mov [length_a], rax
    ;end block
    
    ;start block
    mov rdi, [rel stdin]    ;using this to create a buffer
    call clearerr
    ;end block

    ; output confirm_recieved_A
    mov rax, 0
    mov rdi, confirm_recieved_A
    call printf
    ; end block

    ; output the contents of the array
    mov rax, 0
    mov rdi, myarrA
    mov rsi, [length_a]
    call display_array
    ;end block

    ; output magnitude of Array A message
    mov rax, 0
    mov rdi, magnitude_A
    call printf
    ;end block

    ;output the magnitude of the numbers in array A
    mov rax, 0
    mov rdi, myarrA
    mov rsi, [length_a]
    call magnitude
    ;end block

    ;output the magnitude for array A
    mov rax, 0
    mov rdi, float_format
    mov rax, 1
    call printf
    ;end block

    ; output message 1B
    mov rax, 0
    mov rdi, message_1B
    call printf
    ; end block

    ; output message 2B
    mov rax, 0
    mov rdi, message_2B
    call printf

    ; call input array to recieve the array
    mov rax, 0
    mov rdi, myarrB
    mov rsi, 63
    call input_array
    ;end block

    ;store the array length from input_array function in a non-volatile register to use for other functions
    mov [length_b], rax
    ;End block

    ;start block
    mov rdi, [rel stdin]    ;using this to create a buffer
    call clearerr
    ;end block

    ; output confirm recieved B
    mov rax, 0
    mov rdi, confirm_recieved_B
    call printf
    ;end block

    ; output the contents of the array
    mov rax, 0
    mov rdi, myarrB
    mov rsi, [length_b]
    call display_array
    ;end block

    ; output magnitude of Array B
    mov rax, 0
    mov rdi, magnitude_B
    call printf
    ;end block

    ;output the magnitude of the numbers in array B
    mov rax, 0
    mov rdi, myarrB
    mov rsi, [length_b]
    call magnitude
    ; end block

    ;output the magnitude for array A
    mov rax, 0
    mov rdi, float_format
    mov rax, 1
    call printf
    ;end block

    ; Append array B to array A
    mov rdi, myarrA
    mov rsi, [length_a]
    mov rdx, myarrB
    mov rcx, [length_b]
    call append
    ;end block

    mov r15, rax ;get array C into r10

    ;Call appended message
    mov rax, 0
    mov rdi, appended_message
    call printf
    ;end block

    ;call contains_message
    mov rax, 0
    mov rdi, contains_message
    call printf
    ;end block

    ; display final array
    mov rax, 0
    mov rdi, r15 ;array C
    mov rsi, [length_a] ; put the length of array A in r10
    add rsi, [length_b] ; add the length of array B to the length of array A
    call display_array

    ; output the message for displaying the magnitude for array AB
    mov rax, 0
    mov rdi, magnitude_AB
    call printf
    ; end block

    ;output the magnitude of array AB
    mov rax, 0
    mov rdi, r15 ;array C
    mov rsi, [length_a] ; put the length of array A in r10
    add rsi, [length_b] ; add the length of array B to the length of array A
    call magnitude
    ;end block

    ; Keep the value of magnitude in r9
    movsd xmm12, xmm0

    ;output the magnitude for array AB
    mov rax, 0
    mov rdi, float_format
    mov rax, 1
    call printf

    ; output the message for displaying the mean for array AB
    mov rax, 0
    mov rdi, mean_AB
    call printf
    ;end block

    ;output the mean of array AB
    mov rax, 0
    mov rdi, r15 ;array C
    mov rsi, [length_a] ; put the length of array A in r10
    add rsi, [length_b] ; add the length of array B to the length of array A
    call mean
    ;end block

    ;output the mean for array AB
    mov rax, 0
    mov rdi, float_format
    mov rax, 1
    call printf
    ;end block
    movsd xmm0, xmm12

restore
; Return
ret
