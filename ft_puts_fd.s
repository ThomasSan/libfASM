; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

%define MACH_SYSCALL(nb) 	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
	newl db 10
	null db "(null)", 10
section .text
	global _ft_puts_fd

_ft_puts_fd:
	cmp rdi, 0
	jz get_null
	mov rbx, rdi
	mov r10, rsi
	jmp write_output

get_null:
	mov rdi, rsi
	lea rsi, [rel null]
	mov rdx, 7
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rax, 10
	ret


write_output:
	cmp byte [rbx], 0		; if s[i] == 0
	jz end					; 	return;
	mov rdi, r10
	mov rsi, rbx
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	inc rbx					;
	jmp write_output		;

end:
	mov rdi, r10
	lea rsi, [rel newl]
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rax, 10
	ret
