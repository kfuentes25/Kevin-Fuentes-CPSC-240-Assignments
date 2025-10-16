; Kevin Fuentes
; “CPSC 240-3
; October 16, 2025
; Midterm Program
; kevinfuentes0015@csu.fullerton.edu
; 885809459
global supervisor
extern printf
extern fgets
extern stdin
extern strlen
extern atof
extern input_array
extern outputarray
extern shift_function

%include "data.inc"

segment .data
please_enter db "Please enter a some float numbers separated by ws.  Terminate with ‘enter & control+D.", 10, 0
you_entered db "You entered ", 0
array_now db 10, "The array is now ", 0

segment .bss
align 64
myarr resq 64
arr_len resq 1

segment .text
supervisor:
backup

;Output please_enter message
mov rax, 0
mov rdi, please_enter
call printf
;end block

;call input array
mov rax, 0
mov rdi, myarr
mov rsi, 63
call input_array
;end block

;store the length of the array
mov [arr_len], rax
;end block

;Output the you_entered message
mov rax, 0
mov rdi, you_entered
call printf
;end block

;Call outputarray
mov rax, 0
mov rdi, myarr
mov rsi, [arr_len]
call outputarray
;end block

;call shift_function
mov rax, 0
mov rdi, myarr
mov rsi, [arr_len]
call shift_function
;end block

;decrement the array len
mov [arr_len], rax
;end block

;Output array_now message
mov rax, 0
mov rdi, array_now
call printf
;end block

;Call outputarray
mov rax, 0
mov rdi, myarr
mov rsi, [arr_len]
call outputarray
;end block

;Give the first value of the array to the driver
movsd xmm0, [myarr]
;end block
restore
;Return
ret