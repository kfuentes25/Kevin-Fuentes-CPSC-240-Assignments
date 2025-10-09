;*****************************************************************************************************************************
; Program Name: "Amazon Wishes Delivery Service". This program demonstrates the input and and output floats using scanf and  *
; how to calculate products using operands.                                                                                  *
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
; Program Information: The assembly file that does all calculations, accepts all inputs,
; and outputs all final calculations to the driver
; Name: Amazon Wishes
; Languages: X86, C, bash
; Start Date: August 27th, 2025
; Completion Date: Spetember 4th, 2025
;
; Program's Purpose: This program will serve to help users calculate how much time they spent driving and their average speed
; The "Amazon Wishes" program will teach how to recieve inputs with scanf, how to output floats using xmm registers, and calculating products
;
; Project Information:
; Files: main.cpp, amazonwishes.asm, delivery_script.sh
; Developing Computer: Dell Latitude
; Status: Complete
;
; Translator Information:
; Linux: nasm -f elf64 -o amazonwishes.o amazonwishes.asm
;===== Begin code area =======================================================================================================================

extern printf
extern scanf
extern fgets
extern stdin
extern strlen 
extern atof
global express_delivery

%include "data.inc"

segment .data

description_prompt1 db "This software is maintained by Kevin Fuentes.", 10, 0
description_prompt2 db "For assistance contact the developer at kevinfuentes0015@csu.fullerton.edu.", 10, 0
prompt_miles_driven_1 db "Enter the miles driven from Fullerton to Mission Viejo: ", 0
prompt_average_speed_1 db "Enter the average speed (miles per hour) of that leg of the trip: ", 0
prompt_miles_driven_2 db "Enter the miles driven from Mission Viejo to Long Beach: ", 0
prompt_average_speed_2 db "Enter the average speed (miles per hour) of that leg of the trip: ", 0
prompt_miles_driven_3 db "Enter the miles driven from Long Beach to Fullerton: ", 0
prompt_average_speed_3 db "Enter the average speed (miles per hour) of that leg of the trip: ", 0
total_time db 10, "The total drving time was %.2lf hours.", 10, 0
average_speed db "The average speed was %.2lf m/h", 0

; ALL THINGS TO FORMAT
stringformat db "%s", 0
float_format db "%lf", 0

; DECLARE A NUMBER AS 3 TO BE ABLE TO DIVIDE THE LATER TOTAL MILES AND AVERAGE SPEEDS INDEPENDENTLY
divide dq 3.0

segment .bss

segment .text

; THE HEADER OR LABEL 'express_delivery:' DEFINES THE INITIAL PROGRAM ENTRY POINT
express_delivery:

backup

; PRINTS DESCRIPTION PROMPT 1
mov rax, 0
mov rdi, stringformat
mov rsi, description_prompt1
call printf
; end block

; PRINTS OUT DESCRIPTION PROMPT 2
mov rax, 0
mov rdi, stringformat
mov rsi, description_prompt2
call printf
; end block

; PRINTS PROMPT FOR MILES DRIVEN 1
mov rax, 0
mov rdi, stringformat
mov rsi, prompt_miles_driven_1
call printf
; end block

; ACCEPTS INPUT FOR MILES FROM FULLERTON TO MISSION VIEJO ON THE TOP OF THE STACK
mov rax, 0
mov rdi, float_format
push qword 0
push qword 0
mov rsi, rsp
call scanf
; end block

; COPIES THE NEW NUMBER FROM TOP OF THE STACK TO XMM REGISTER
movsd xmm15, [rsp]
pop rax
pop rax
; end block

; PRINTS PROMPT FOR AVERAGE SPEED 1
mov rax, 0
mov rdi, stringformat
mov rsi, prompt_average_speed_1
call printf
; end block

; ACCEPTS INPUT FOR AVERAGE SPEED FROM FULLERTON TO MISSION VIEJO ON THE TOP OF THE STACK
mov rax, 0
mov rdi, float_format
push qword 0
push qword 0
mov rsi, rsp
call scanf
; end block

; COPIES THE NEW NUMBER FROM TOP OF THE STACK TO XMM REGISTER
movsd xmm12, [rsp]
pop rax
pop rax
; end block

; PRINTS PROMPT FOR MILES 2
mov rax, 0
mov rdi, stringformat
mov rsi, prompt_miles_driven_2
call printf
; end block

;ACCEPTS INPUT FOR MILES FROM MISSION VIEJO TO LONG BEACH ON THE TOP OF THE STACK
mov rax, 0
mov rdi, float_format
push qword 0
push qword 0
mov rsi, rsp
call scanf
; end block

; COPIES THE NEW NUMBER FROM TOP OF THE STACK TO XMM REGISTER
movsd xmm14, [rsp]
pop rax
pop rax
; end block

; PRINTS PROMPT FOR AVERAGE SPEED 2
mov rax, 0
mov rdi, stringformat
mov rsi, prompt_average_speed_2
call printf
; end block

; ACCEPTS INPUT FOR AVERAGE SPEED FROM MISSION VIEJO TO LONG BEACH ON THE TOP OF THE STACK
mov rax, 0
mov rdi, float_format
push qword 0
push qword 0
mov rsi, rsp
call scanf
; end block

; COPIES THE NEW NUMBER FROM TOP OF THE STACK TO XMM REGISTER
movsd xmm11, [rsp]
pop rax
pop rax
; end block

; PRINT PROMPT FOR MILES 3
mov rax, 0
mov rdi, stringformat
mov rsi, prompt_miles_driven_3
call printf
; end block

; ACCEPTS INPUT FOR MILES FROM LONG BEACH TO FULLERTON
mov rax, 0
mov rdi, float_format
push qword 0
push qword 0
mov rsi, rsp
call scanf
; end block

; COPIES THE NEW NUMBER FROM TOP OF THE STACK TO XMM REGISTER
movsd xmm13, [rsp]
pop rax
pop rax
; end block

; PRINTS PROMPT FOR AVERAGE SPEED 3
mov rax, 0
mov rdi, stringformat
mov rsi, prompt_average_speed_3
call printf
; end block

; ACCEPTS INPUT FOR AVERAGE SPEED FROM LONG BEACH TO FULLERTON
mov rax, 0
mov rdi, float_format
push qword 0
push qword 0
mov rsi, rsp
call scanf
; end block

; COPIES THE NEW NUMBER FROM TOP OF THE STACK TO XMM REGISTER
movsd xmm10, [rsp]
pop rax
pop rax
; end block

; GET THE DIVISION NUMBER INTO THE CORRECT FORM AND IN A FLOAT REGISTER
movsd xmm9, [divide]
; end block

; ADD ALL MILES DRIVEN FLOATS AND GET THE TOTAL (distance)
addsd xmm15, xmm14
addsd xmm15, xmm13
; end block

; ADD AVERAGE SPEED FLOATS AND GET THE AVERAGE (speed)
addsd xmm12, xmm11
addsd xmm12, xmm10
divsd xmm12, xmm9
; end block

; DIVIDE AVERAGE SPEED BY MILES DRIVEN TO GET TOTAL TIME DRIVEN
divsd xmm15, xmm12
; end block

; OUTPUT TOTAL DRIVING TIME
mov rax, 1
mov rdi, total_time
movsd xmm0, xmm15
call printf
; end block

; OUTPUT AVERAGE SPEED
mov rax, 1
mov rdi, average_speed
movsd xmm0, xmm12
call printf
; end block


; GIVE THE AVERAGE SPEED TO THE DRIVER
movsd xmm0, xmm12
; end block

restore
; Return
ret