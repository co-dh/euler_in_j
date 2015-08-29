#include <stdio.h>
int sq_sum(int x, int y)
{
	return x*x + y * y;
}

int right(int x0, int  y0, int x1, int  y1)
{
	int a = sq_sum(x0,y0);
	int b = sq_sum(x1,y1); 
	int c = sq_sum(x0-x1, y0-y1); 
	if (b > c)
	{
		int t;
		t=b; b=c; c=t;
	}
	if (a > c)
	{
		int t;
		t=a; a=c; c=t;
	}
	return a + b == c;
} 

int cnt(int n) 
{
	int cc = 0;
	for (int x1 = 0; x1 < n; ++x1)
	{
		for (int x2 = x1; x2 < n; ++x2)
		{
			for (int y1 = 0; y1 < n; ++y1)
			{
				for (int y2 = 0; y2 < n; ++y2)
				{
					if (x1 == x2 && y1 >= y2) continue;
					if (x1 == 0  && y1 == 0 ) continue;
					if (x2 == 0  && y2 == 0 ) continue;
					if (x1 == 0  && x2 == 0 ) continue;
					if (y1 == 0  && y2 == 0 ) continue;
					if (x1 == x2 && y1 == 0 ){
						cc++;	
					} else if (y1 == y2 && x1 == 0 ){
						cc++;	
					} else if (x1 == 0 && y2 ==0 && y1 != 0 && x2 != 0){
						cc++;
					} else if ( right (x1,y1,x2,y2)){
						cc++;
					}
				}				
			}
		}
	}
	return cc;
}

int main(int argc, char const *argv[])
{
	printf("%d\n", cnt(51));
	return 0;
}