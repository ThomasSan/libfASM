; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_strchr

_ft_strchr:
	mov rbx, rdi	; saving rdi into rbx
	mov al, 0		; stoping char = '\0'
	mov rcx, 0xFFFFFFFFFFFFFFFF
	repne scasb		;	while (*str != '\0') str++
	mov rcx, rdi	;
	sub rcx, rbx	;	rcx contain the lenght of the string
	inc rcx
	mov rdi, rbx	;	restoring rdi value
	mov rax, rsi	;	putting the char to find into rax
	repne scasb		;	while (*str != c) str++
	cmp rcx, 0		;	if !str
	jz ret_null		;		return NULL
	dec rdi			; 	str--;
	mov rax, rdi	;	ret = str;
	ret				;	return ret
	
ret_null:
	mov rax, 0
	ret
