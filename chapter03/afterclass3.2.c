#include <unistd.h>

int mydup2(int oldfd, int newfd)
{
	int tfd;
	if (newfd < 0)
		return -1;
	if (newfd == oldfd)
		return newfd;
	close(newfd);
	if ((tfd == dup(oldfd)) == newfd)
	{
		return newfd;
	} else {
		mydup2(oldfd, newfd);
		clsose(tfd);
	}
	return newfd;
}
