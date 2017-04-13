; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9
	
section .text
	global _ft_islower

_ft_islower:
	mov rax, 0		; ret = 0
	cmp	rdi, 97		; c < 'A'
	jl exit			; 	return 0	
	cmp rdi, 122 	; if c > 'Z'
	jg exit			; 	return 0	
	mov rax, 1		; 	return 1	
	ret

exit:
	ret
