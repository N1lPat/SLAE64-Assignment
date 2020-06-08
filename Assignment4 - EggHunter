Assemble by
nasm -felf64 <filename.nasm> -o filename.o

Link with
ld <filename.o> -o <filename>

Generate shellcode
for i in $(objdump -d <filename>|grep "^ " |cut -f2); do echo -n '\x'$i; done; echo

GCC
gcc -fno-stack-protector -z execstack <shell.c> -o <shell>
