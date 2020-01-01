format ELF64
public _start


section ".data" writable
    string db "hello world", 0xA, 0
    length = $-string

section ".text" executable
_start:
    mov rax, 4
    mov rbx, 1
    mov rcx, string
    mov rdx, length
    int 0x80

    mov rax, 1
    xor rbx, rbx
    int 0x80
