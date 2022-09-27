; input
; rax = string;
; output
; rax = string_length
lenght_string:
    push rax
    xor rbx, rbx
    .iter:
        cmp [rax], byte 0
        je .close
        inc rbx
        inc rax
        jmp .eter
    .close:
        pop rax
        ret
