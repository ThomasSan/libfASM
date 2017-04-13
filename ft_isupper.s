; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_isupper

_ft_isupper:
	mov rax, 0		; ret = 0
	cmp	rdi, 65		; c < 'A'
	jl exit			; 	return 0	
	cmp rdi, 90 	; if c > 'Z'
	jg exit			; 	return 0	
	mov rax, 1		; 	return 1	
	ret

exit:
	ret
