; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_tolower

_ft_tolower:
	cmp rdi, 'A'
	jl end			; 
	cmp rdi, 'Z'
	jg end			; 
	add rdi, 32

end:
	mov rax, rdi
	ret
