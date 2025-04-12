#include <stdio.h>

extern "C" void asmFunc(void);             // extern "C" to prevent name mangling 

int main(void)
    {
    printf("Calling asmMain:\n");
    asmFunc();
    printf("Returned from asmMain\n");
    return 0;
    }