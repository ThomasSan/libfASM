;void	*memset(void *b, int c, size_t len)
; Notes :
; - Les 6 premiers parametres sont stockes dans les registres rdi, rsi, rdx, rcx, r8, r9

section .text
	global _ft_memset

_ft_memset:
	mov r10, rdi
	mov rax, rsi			; rax = c
	mov rcx, rdx			; i = len
	rep	stosb				; while (i) b[i] = rax; i--;
	mov rax, r10
	ret						;}
