section .data
    msg db "The largest digit is: ", 0xa, 0xd
    len equ $-msg
    num1 dd '47'
    num2 dd '22'
    num3 dd '31'

segment .bss
    largest resb 2

section .text
    global _start

_start:
    mov ecx, [num1]
    cmp ecx, [num2]
    jg check_third_number
    mov ecx, [num2]

check_third_number:
    cmp ecx, [num3]
    jg _exit
    mov ecx, [num3]

_exit:
    mov [largest], ecx
    mov ecx, msg
    mov edx, len
    mov ebx, 1 ; stdout
    mov eax, 4 ; sys_write
    int 0x80

    mov ecx, largest
    mov edx, 2
    mov ebx, 1 ; stdout
    mov eax, 4 ; sys_write
    int 0x80

    mov eax, 1
    int 80h