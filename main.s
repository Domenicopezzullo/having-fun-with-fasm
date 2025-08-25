format ELF64 executable
entry _start

segment readable executable

_start:
	mov rsi, message
	mov rdx, message.len
	call print

	mov rdi, 0
	mov rsi, file_name
	mov rdx, 100
	call read
	cmp rax, 0
	jl error_read

    mov rcx, rax
    mov byte [file_name + rcx], 0
    mov rbx, file_name
    call remove_newline

	mov rdi, file_name
	call open
	cmp rax, 0
	jl error_open

	mov rdi, rax
	mov rsi, buffer
	mov rdx, 1023
	call read
	mov r8, rax

	mov rsi, buffer
	mov rdx, rax
	call print

	mov rdi, r8
	call close

	mov rdi, 0
	call exit

include "syscalls.s"
include "utils.s"
include "failures.s"

segment readable writable

message db "Input file to read: ", 0
	.len = $ - message

file_name rb 101
buffer rb 1024
