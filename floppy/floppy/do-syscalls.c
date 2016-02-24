#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/times.h>
#include <time.h>

int main(int c, char *v)
{
	int n,m;
	int pd[2];

	pipe(&pd[0]);

	while(1){
		n = open("/root/.profile", O_RDONLY);
		sleep(1);
		close(n);
	}
	return 0;
}
