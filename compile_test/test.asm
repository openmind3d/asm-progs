section .text
    global _start

_start:
    mov eax, 1
    mov ebx, 0 ; exit code
    int 0x80