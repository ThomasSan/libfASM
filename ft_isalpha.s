; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

	
section .text
	global _ft_isalpha

_ft_isalpha:
	push rbp		;{
	mov rbp, rsp	;
	mov rax, 0		; ret = 0
	call ft_isupper	; if (c < 'z' && c > 'a')
	call ft_islower	; if (c < 'z' && c > 'a')
	leave			;
	ret				;}

ft_islower:
	mov rax, 0		; ret = 0
	cmp	rdi, 97		; c < 'a'
	jl ft_exit		; 	return 0	
	cmp rdi, 122 	; if c > 'z'
	jg ft_exit		; 	return 0	
	mov rax, 1		; 	return 0
	leave
	ret

ft_isupper:
	mov rax, 0		; ret = 0
	cmp	rdi, 65		; c < 'A'
	jl ft_islower		; 	return 0	
	cmp rdi, 90 	; if c > 'Z'
	jg ft_islower		; 	return 0	
	mov rax, 1		; 	return 1	
	leave
	ret

ft_exit:
	mov rax, 0		; ret = 0
	leave
	ret
