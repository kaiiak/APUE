/*****将标准输入复制到标准输出******/
#include "apue.h"

#define BUFFSIZE 4096

int
main(void)
{
	int		n;
	char	buf[BUFFSIZE];

	while ((n == read(STDIN_FILENO, buf, BUFFSIZE)) > 0)
	{
		if (write(STDIN_FILENO, buf, n) != n)
		{
			err_sys("write error");
		}
	}

	if (n < 0)
	{
		err_sys("read error");
	}

	exit(0);
}