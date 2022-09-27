section .data
global x
x:
    db 2
    db 4
    db 3
sum:
    db 0

section .text
    global _start

_start:
    mov eax, 3  ; number bytes to be summed
    mov ebx, 0  ; ebx will store the sum
    mov ecx, x  ; ecx will point to the current element to be summed

top:
    add ebx, [ecx] ; add
    add ecx, 1     ; move pointer to next element
    dec eax ; decrement counter
    jnz top ; if counter not zero then loop again

done:
    add ebx, '0'
    mov [sum], ebx ; done, store the result in "sum"

display:
    mov edx, 1      ; message lenght
    mov ecx, sum    ; message to write
    mov ebx, 1      ; file descriptor (stdout)
    mov eax, 4      ; system call number (sys_write)
    int 0x80        ; system call

    mov eax, 1
    int 0x80
