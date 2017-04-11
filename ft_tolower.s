; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_tolower

_ft_tolower:
	cmp byte rdi, 'A'
	jl end			; 
	cmp byte rdi, 'Z'
	jg end			; 
	add byte rdi, 32

end:
	mov rax, rdi
	ret
