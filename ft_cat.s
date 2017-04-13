; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define	READ				3
%define WRITE				4
%define STDOUT				1
%define BUFF_SIZE			4096

section .bss
	buff:	resb BUFF_SIZE

section	.text
	global _ft_cat
	extern _read

_ft_cat:
	push rbp
	mov rbp, rsp
	push rbx
	mov rbx, rdi

read_loop:
	mov rdi, rbx
	mov rax, MACH_SYSCALL(READ)		; Calling Read
	lea rsi, [rel buff]
	mov rdx, BUFF_SIZE
	syscall
	jc end

	cmp rax, 0						;fin de lecture
	jle end
	
	lea rsi, [rel buff]
	mov rdi, 1
	mov rdx, rax
	mov rax, MACH_SYSCALL(WRITE)	; Calling Write
	syscall
	jc end							;carry flag if error

	jmp read_loop

end:
	pop rbx
	leave
	ret
