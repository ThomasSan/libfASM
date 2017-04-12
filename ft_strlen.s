; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_strlen

_ft_strlen:
	mov r10, rdi	;	start = str
	mov al, 0		;	c = '\0'
	mov rcx, 0xFFFFFFFFFFFFFFFF
	repne scasb		;	while (*str != c) str++
	dec rdi			; 	str--;
	mov rax, rdi	;	ret = str;
	sub rax, r10	;	ret - start;
	ret				;	return ret
