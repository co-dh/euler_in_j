#include "stdlib.h"
#include "stdio.h"

int isPalin(unsigned long x)
{
	unsigned long rev = 0;
	for (unsigned long x1 = x; x1 > 0; x1 /= 10)
	{
		rev = rev * 10 + x1 % 10;
	}
	return rev;
}

void findAll(int limit)
{
	unsigned long ss;
	for (int s = 0; s < limit; ++s)
	{
		ss = s * s;
		
		for (int e = s+1; e < limit; ++e)
		{

		}
	}
}

int main(int argc, char const *argv[])
{
}
