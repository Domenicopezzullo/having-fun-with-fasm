error_open:
    mov rsi, open_err
    mov rdx, open_err.len
    call print

    mov rdi, 1
    call exit

error_read:
    mov rsi, read_err
    mov rdx, read_err.len
    call print

    mov rdi, 1
    call exit

segment readable writable

read_err db "Error: could not read from file", 10, 0
    .len = $ - read_err
open_err db "Error: could not open file", 10, 0
    .len = $ - open_err
