/*打印进程ID*/

#include "apue.h"

int
main(void)
{
	printf("Hello World from process ID %ld\n", (long)getpid());
	exit(0);
}