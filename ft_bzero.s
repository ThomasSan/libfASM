; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_bzero

_ft_bzero:
	cmp rsi, 0				; if i != 0
	jz end					; return;
	mov byte [rdi], 0		;{
	inc rdi					;
	dec rsi					; n--
	jmp _ft_bzero			;	b_zero
	ret						;}

end:
	ret
