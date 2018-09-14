#include "apue.h"

int main(void)
{
	char *ptr;
	size_t size;
	if (chdir("/usr/local") < 0)
		err_sys("chidr failed");
	ptr = path_alloc(&size);	/* our own funcation */
	if (getcwd(ptr, size) == NULL)
		err_sys("getcwd failed");
	printf("cwd = %s\n", ptr);
	exit(0);
}
