; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_strcat

_ft_strcat:
	mov rax, rdi

go_to_end:
	cmp byte [rdi], 0
	jz go_cat
	inc rdi
	jmp go_to_end

go_cat:
	cmp byte [rsi], 0				; if dst[i] != 0
	jz end					; return;
	mov bh, byte [rsi]
	mov byte [rdi], bh
	inc rsi
	inc rdi
	jmp go_cat

end:
	mov byte [rdi], 0
	ret
