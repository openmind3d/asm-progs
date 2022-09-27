section .data
    msg db "The sum is:", 0xa
    len equ $-msg
    num1 db "12345"
    num2 db "23456"
    sum db "     "

section .text
    global _start

_start:
    mov esi, 4
    mov ecx, 5
    clc

add_loop:
    mov al, [num1 + esi]
    adc al, [num2 + esi]
    aaa
    pushf
    or al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop add_loop

    mov edx, len
    mov edx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 5 ; message lenght
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80
