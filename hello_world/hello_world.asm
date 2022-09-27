
section .text
    global _start ;must by declared for linker (ld)

; this program displays a message on screen
_start:             ; tells linker entry point
    mov edx, len    ; message lenght
    mov ecx, msg    ; message to write
    mov ebx, 1      ; file descriptor (stdout)
    mov eax, 4      ; system call number (sys_write)
    int 0x80        ; call kernel

    mov eax, 1      ; system call number (sys_exit)
    int 0x80        ; call kernel

section .data
    msg db 'Hello, world', 0xa  ; string to be printed
    len equ $ - msg             ; length of the string
