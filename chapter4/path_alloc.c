#include "apue.h"
char*path_alloc(size_t* size)
{
char *p = NULL;
if(!size) return NULL;
p = malloc(256);
if(p)
*size = 256;
else
*size = 0;
return p;
}
