;void	*memset(void *b, int c, size_t len)
; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_memset

_ft_memset:
	cmp rdx, 0				; if i != 0
	jz end					; return;
	mov byte [bx], rsi
	mov byte [rdi], bx		;{
	inc rdi					;
	dec rdx					; n--
	jmp _ft_memset			;	b_zero
	ret						;}

end:
	ret
