; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

_ft_isalnum:
	mov rax, 0			; ret = 0
	call _ft_isalpha	;
	cmp rax, 0
	jz isdigit			;
	ret					;}

isdigit:
	call _ft_isdigit	;
	ret
