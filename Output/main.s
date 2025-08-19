section .data
    msg db "Hello, World!", 0xA ;msg
    msglen equ $-msg ;len of msg
section .text
    global _start

_start:
    mov rax, 1 ;syswrite
    mov rdi, 1 ;stdout
    mov rsi, msg ;writes the msg in rsi
    mov rdx, msglen ;writes the len in rdx
    syscall ;calls syswrite

    mov rax, 60 ;exit code
    mov rdi, 0 ;sys exit
    syscall ;calls sys exit