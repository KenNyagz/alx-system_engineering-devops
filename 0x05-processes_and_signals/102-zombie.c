#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int infinite_while(void);
/**
*main - entry point
*Function creates 5 zombie processes
*Return: 0 success, 1 failure
*
*/

int main (void)
{

	pid_t zombie_pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		zombie_pid = fork();
		if (zombie_pid == -1)
		{
			perror("Fork failed");
			exit(1);
		}

		if (zombie_pid == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
	}
	infinite_while();
	return (0);
}



int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
