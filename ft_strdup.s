; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

;char	*strdup(char *s)
;void	*malloc(size_t *size)

section	.text
	global	_ft_strdup
	extern	_malloc

_ft_strdup:
	push rbp
	mov rbp, rsp

	mov rdx, rdi
	mov al, 0
	mov rcx, 0xFFFFFFFFFFFFFFFF
	repne scasb	
	sub rdi, rdx	;	ret - start;

	push rdi			; saving rdi
	push rdx			; saving rdi

	call _malloc		; malloc(sizeof(len))

	pop rdx
	pop rdi

	mov rcx, rdi
	mov rsi, rdx
	mov rdi, rax
	rep	movsb				; while (i) b[i] = rax; i--;
	leave
	ret						;}
