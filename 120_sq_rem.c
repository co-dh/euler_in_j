#include "stdlib.h"
#include "stdio.h"
int rem(int x)
{
	int x1 = x - 1;
	if(x1 % 2 != 0) x1 --;
	return x * x1;
}

int sum()
{
	int s = 0;
	for (int i = 3; i < 1001; ++i)
	{
		s += rem(i);
	}
	return s;
}
int main(int argc, char const *argv[])
{
	//int i = atoi(argv[1]);
	//printf("%d\n", rem(i));
	printf("%d\n", sum());
	return 0;
}