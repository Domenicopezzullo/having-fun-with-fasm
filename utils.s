; Input:
;   rbx = pointer to string (file_name)
;   rcx = max length (bytes read from input)
remove_newline:
    push rdi
    push rcx

    xor rdi, rdi  ; index = 0

.loop:
    cmp rdi, rcx
    jge .done

    mov al, byte [rbx + rdi]
    cmp al, 0x0A       ; newline?
    je .replace
    cmp al, 0          ; null terminator?
    je .done

    inc rdi
    jmp .loop

.replace:
    mov byte [rbx + rdi], 0

.done:
    pop rcx
    pop rdi
    ret
