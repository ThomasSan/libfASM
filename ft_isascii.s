; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_isascii

_ft_isascii:
	push rbp		;{
	mov rbp, rsp	;
	mov rax, 0		; ret = 0
	cmp	rdi, 0		; c < 0
	jl ft_exit		; 	return 0
	cmp rdi, 127 	; if c > 255
	jg ft_exit		; 	return 0	
	mov rax, 1		; return 1
	leave			;
	ret				;}

ft_exit:
	leave
	ret
