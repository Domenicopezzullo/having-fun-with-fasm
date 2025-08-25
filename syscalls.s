print:
	mov rax, 1
	mov rdi, 1
	syscall
	ret
read:
	mov rax, 0
	syscall
	ret
exit:
	mov rax, 60
	syscall
open:
	mov rax, 2
	mov rsi, 0
	mov rdx, 0
	syscall
	ret
close:
	mov rax, 3
	syscall
	ret
