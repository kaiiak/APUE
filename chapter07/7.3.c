#include "apue.h"

static void		myexit1(void);
static void		myexit2(void);

int main(void)
{
	if (atexit(myexit2) != 0)
		err_sys("can't register myexit2");

	if (atexit(myexit1) != 0)
		err_sys("can't register myexit1");
	if (atexit(myexit1) != 0)
		err_sys("can't register myexit1");

	printf("main is done\n");
	return 0;
}

static void myexit1(void)
{
	printf("first exit handler\n");
}

static void myexit2(void)
{
	printf("second exit handler\n");
}
