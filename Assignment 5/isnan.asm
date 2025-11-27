;Library function isnan
;Stored in filel isnan.asm
;Author: unknown:
;Source: public domain website
;Function name: isnan0     ;This avoids conflict with existing function with name isnan.

;Strategy: Online information about ucomisd states that if either of the two operands
;of ucomisd are nans then ucomisd set 1 into flag PF and will clear flag PF to 0 if 
;both operands are normal numbers (not nans).

global isnan
extern printf

segment .data
   ;empty
   ;The next declaration is for debug purposes.  Remove it after testing this function.
   intform db "The value to be returned is %ld",10,0
segment .bss
   ;empty
segment .text
   isnan:
;Back up the GPRs (General Purpose Registers)
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

;Save a secure copy of incoming parameter
movsd xmm15,xmm0

;Compare xmm15 with itself to place a value in flag pf (parity flag)
ucomisd xmm15,xmm15

;Now we need to discover what ucomisd placed into PF inside of rflags. Is it 1 or 0?
;Fortunately, there is an instruction that will copy the PF bit to rax, namely setp.

setp al        ;Copy the single bit in PF to rax (lowest 8 bits)
               ;Now rax is either 0 (normal number) or 1 (nan value)
cbw            ;Extend al to ax
cwde           ;Extend ax to eax
cdqe           ;Extend eax to rax

;Prepare to send r15 to the caller.
;mov rax,r15

;Restore backed up general registers
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp   ; Restore rbp to the base of the activation record of the caller program
ret
