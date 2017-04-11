; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_strlen

_ft_strlen:
	mov r10, rdi
	mov rbx, rdi

count_char:
	cmp byte [rbx], 0		; if s[i] == 0
	jz end					; 	return;
	inc rbx					;
	jmp count_char

end:
	mov rax, rbx
	sub rax, r10
	ret
