#include "stdio.h"
#include "stdlib.h"
int sols(unsigned long n)
{
	int cnt = 0;
	float y = n * (n +1);
	for (int x = n+1;  y >= n+1; ++x)
	{
		y = (float)(n * x) / (float)(x-n);
		if(y == (int)y && x <= y){
			//printf("%d, %f\n",x, y );
			cnt ++;
		}
	}
	return cnt;
}

void brute()
{
	for (int i = 0; ; ++i)
	{
		if(i % 1000 == 0)
		{
			printf("%d, %d\n", i, sols(i));
		}
		if(sols(i) > 1000)
		{
			printf("%d, %d\n", i, sols(i));
			break;
		}
	}

}
int main(int argc, char const *argv[])
{
	int n = atoi(argv[1]);
	//sols(i);
	for (int i = 0; i < n; ++i)
	{
		printf("%d, %d\n", i, sols(i));
	}

	return 0;
}