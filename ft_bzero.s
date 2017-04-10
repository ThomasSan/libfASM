%define MACH_SYSCALL(nb) 0x2000000 | nb

section .data
hello:
	.string db "Hello World!", 10
	.len equ $ - hello.string

section .text
	global start
	global _main 
	extern _printf

start:
	xor eax, eax
	mov ecx, 10
	call _main
	ret

_main:
	inc eax
	;push rbp
	;mov rbp, rsp
	;sub rsp, 16
	;mov rdi, 1
	;mov rdx, hello.len
	;lea rsi, [rel hello.string]
	;mov rax, MACH_SYSCALL(4)
	;syscall
	;leave

	loop _main
	ret
