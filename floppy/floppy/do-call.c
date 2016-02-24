#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/times.h>
#include <time.h>
#include <errno.h>
#include <sys/types.h>
#include <signal.h>

 struct sigaction {
               void     (*sa_handler)(int);
               sigset_t   sa_mask;
               int        sa_flags;
           };


char b[] = "erthy";
struct sigaction intaction;
sigset_t block_mask;

void handler (int);

int main(int c, char *v[])
{
	int n,m,p;
	int pd[2];
	struct tms t;
	/*build sigaction for children*/
	sigemptyset(&block_mask);
	intaction.sa_mask = block_mask;
	intaction.sa_handler = handler;
	sigaction(SIGALRM, &intaction, NULL);

	p = c < 2 || v[2][1] != 'n';

	if (c > 1){
		if (p) pause();
		switch(v[1][0]){
			case 'p':
				/*printf("pipe\n");*/
				pipe(&pd[0]);
				write(pd[1], &b, 4);
				read(pd[0], &b, 4);
				break;
			case 't':
				/*printf("times\n");*/
				times(&t);
				break;
			case 'f':
				/*printf("fork\n");*/
				if (fork() == 0) exit(0);
				break;
			case 'o':
				/*printf("open\n");*/
				n = open("/root/.profile", O_RDONLY);
				read(n, &b, 4);
				close(n);
				break;
			case 'q':
				/*printf("open\n");*/
				n = open("/root/.profile", O_RDONLY);
				read(n, &b, 4);
				read(n, &b, 1);
				close(n);
				break;
			default:
				printf("illegal:%s\n", v[1][0]);
		}
	}		

	return 0;
}

void handler (int sig)
{
	/*printf("pid %d\n", getpid());*/
}