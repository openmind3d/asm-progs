SYS_EXIT equ 1
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    msg1 db "Hello, programmers", 0xa, 0xd
    len1 equ $ - msg1

    msg2 db "Welcome to the world of", 0xa, 0xd
    len2 equ $ - msg2

    msg3 db "Linux assembly programming", 0xa, 0xd
    len3 equ $ - msg3