
section .text
    global _start

_start:
    mov al, '3'
    sub al, '0'

    mov bl, '2'
    sum bl, '0'
    mul bl, '3'
    add al, '0'

    mov [res], al
    mov ecx, msg
    mov edx, len
    mov ebx, 1 ; stdout
    mov eax, 4 ; sys_write
    int 0x80

    mov ecx, res
    mov edx, 1
    mov ebx, 1 ; stdout
    mov eax, 4 ; sys_write
    int 0x80 ; syscall

    exit

exit:
    mov eax, 1 ; sys_exit
    int 0x80 ; system call

section .data
    msg db "The result is:", 0xa, 0xd
    len equ $-msg

segment .bss
    res resb 1