global input_array
extern getline
extern stringtof
%include "data.inc"

segment .data
segment .bss
stringnum resq 100
segment .text
input_array:



;Input Array starts
    mov r15, rdi
    mov r14, rsi
    xor r13, r13

    inputloop:
    cmp al, 10 ; if linefeed, input done
    je done
;check if capacity has been reached
    cmp r13, r14
    jge done
    jmp inputloop
;endblock

;block inputs 1 num as a string
    mov rdi, stringnum
    mov rsi, 40
    call getline
;endblock

;block that converts stringnum to xmm0
    mov rdi, stringnum
    call stringtof
;endblock

;add to array r15 at position r13
    movsd [r15+8*r13], xmm0
    inc r13
    jmp inputloop
;endblock
done:
mov rax, r13

;End input Array