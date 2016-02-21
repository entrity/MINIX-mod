#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <stdio.h>

int main(int c, char *v)
{
	int n,m;
	m = 4;
	if (c>1)
		sscanf(v[1], "%d", &m);
	for(n=0;n<4;n++){
		sleep(1);
		switch(fork()){
			case -1:
			fprintf(stderr,"failedtoforkfromprocess %d\n",getpid());
			break;
			case 0:
			while(1);
		break;	
		default:
		break;		
		}		
	}
		while(1);


	return 0;
}
