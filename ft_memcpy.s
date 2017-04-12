;void	*memcpy(void *dst, void *src, size_t n)
; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_memcpy

_ft_memcpy:
	mov rax, rdi			; rax = c
	mov rcx, rdx			; i = len
	rep	movsb				; while (i) b[i] = rax; i--;
	ret						;}
