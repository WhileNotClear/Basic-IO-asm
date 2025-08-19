section .bss
    inputbuffer resb 32 ;alloc 32 bytes
section .data
    dirop db ">> ", 0
    diroplen equ $-dirop
    
    ysmsg db "you said: ", 0
    ysmsglen equ $-ysmsg

section .text
    global _start

_start:
    ; ----- ">> txt" -------
    mov rax, 1
    mov rdi, 1 
    mov rsi, dirop
    mov rdx, diroplen
    syscall

    ; ------ "input " --------
    mov rax, 0
    mov rdi, 0
    mov rsi, inputbuffer
    mov rdx, 32
    syscall

    ;-------"you said: "-------
    mov rax, 1
    mov rdi, 1
    mov rsi, ysmsg
    mov rdx, ysmsglen
    syscall

    ;------ "text" ---------
    mov rax, 1
    mov rdi, 1 
    mov rsi, inputbuffer
    mov rdx, 32
    syscall

    ;------"exit code"-------
    mov rax, 60
    mov rdi, 0
    syscall