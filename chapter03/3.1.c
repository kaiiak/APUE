/* 测试标准输入能否被设置偏移量 */
#include "apue.h"

int
main(void)
{	/* STDIN_FILENO 与进程有关的标准输入关联 */
	if (lseek(STDIN_FILENO, 0, SEEK_CUR) == -1)
		printf("cannot seek\n");
	else
		printf("seek OK\n");
	exit(0);
}