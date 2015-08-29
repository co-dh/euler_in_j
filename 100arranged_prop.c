#include <math.h>
#include <stdlib.h>
#include <stdio.h>

unsigned long sq(unsigned long x)
{
	return x*(x-1);
}

unsigned long find(unsigned long x)
{
	// given x, find b where x(x-1)= 2b(b-1)
	unsigned long b0 = x / sqrt(2);
	unsigned long xx = sq(x);

	unsigned long b = b0;
	unsigned long bb = 0;
	while ( (bb = 2 *sq(b)) > xx){
		//printf("%lu, %lu, %lu, %d\n", b, bb, xx, bb>xx);
		b--;	
	} 
	if (bb == xx)	return b;

	b = b0;
	while ( (bb = 2 *sq(b)) < xx){
		//printf("%lu\n", b);
		b++;	
	} 
	if (bb == xx)	return b;

	return 0;
}

unsigned long find1()
{
	for (unsigned long i = 1e12; ; ++i)
	{
		if(i % 100000 == 0)
			printf("%lu\n", i);
		unsigned long r = find(i);
		if(r) return r;
	}
}


typedef unsigned long ulong;
ulong next()
{
	ulong b = 15;
	ulong n = 21;
	while(n < 1e12){
		ulong b1 = 3 * b + 2 * n - 2;
		n = 4 * b + 3 * n - 3;
		b = b1;
	}
	printf("%lu\n", n);
	return b;
}
int main(int argc, char const *argv[])
{
	//printf("%lu\n", find1());	
	//printf("%lu\n", find(1004476150652));
	printf("%lu\n", next());
	return 0;
}

// 1004476100000 1004476150652