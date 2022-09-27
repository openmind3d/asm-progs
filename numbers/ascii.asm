section .data
    msg db "The result is: "
    len equ $-msg

    testMsg db 0xa, "test msg", 0xa, 0xd
    testMsgLen equ $-testMsg

section .bss
    res resb 1

section .text
    global _start

_start:
    sub ah, ah
    mov al, '9'
    sub al, '3'
    aas
    or al, 30h
    mov [res], ax

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, res
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, testMsgLen
    mov ecx, testMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80