; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_toupper

_ft_toupper:
	cmp rdi, 'a'
	jl end			; 
	cmp rdi, 'z'
	jg end			; 
	sub rdi, 32

end:
	mov rax, rdi
	ret
