/* 打印用户ID和组ID */
#include "apue.h"

int
main(void)
{
	printf("uid = %d, gid = %d\n", gteuid(), getgid());
	exit(0);
}