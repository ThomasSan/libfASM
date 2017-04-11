; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

%define MACH_SYSCALL(nb) 	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
	bite db 10
	null db "(null)", 10
section .text
	global _ft_puts

_ft_puts:
	cmp rdi, 0
	jz get_null
	mov r10, rdi
	mov rbx, rdi
	jmp write_output

get_null:
	mov rdi, STDOUT
	lea rsi, [rel null]
	mov rdx, 7
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rax, 10
	ret


write_output:
	cmp byte [rbx], 0		; if s[i] == 0
	jz end					; 	return;
	mov rdi, STDOUT
	mov rsi, rbx
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	inc rbx					;
	jmp write_output		;

end:
	mov rdi, STDOUT
	lea rsi, [rel bite]
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rax, 10
	ret
