#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/times.h>
#include <time.h>

int main(int c, char *v)
{
	int n,m;
	int pd[2];
	struct tms buff;
	switch(fork()){
		case -1:
		fprintf(stderr,"failedtoforkfromprocess %d\n",getpid());
		break;
		case 0:
		exit(1);
	break;	
	default:
	break;		
	}		

	pipe(&pd[0]);


	times(&buff);
	alarm(14);
	pause();

	return 0;
}
