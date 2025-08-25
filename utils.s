remove_newline:
    push rdi
    push rcx

    xor rdi, rdi 

.loop:
    cmp rdi, rcx
    jge .done

    mov al, byte [rbx + rdi]
    cmp al, 0x0A
    je .replace
    cmp al, 0
    je .done

    inc rdi
    jmp .loop

.replace:
    mov byte [rbx + rdi], 0

.done:
    pop rcx
    pop rdi
    ret
