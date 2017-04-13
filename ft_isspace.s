; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_isspace

_ft_isspace:
	cmp	rdi, ' ' 	; c == ' ' 
	jz space		; 	return 1
	cmp rdi, 9	 	; c < tab
	jl ft_exit		; 	return 0	
	cmp rdi, 13 	; c > cr
	jg ft_exit		; 	return 0

space:
	mov rax, 1
	ret

ft_exit:
	mov rax, 0
	ret
