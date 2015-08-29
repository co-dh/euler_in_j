#include <stdio.h>
#include <stdlib.h>

void part(int n)
{
	int m,h,r,t;
	int *x = (int*)malloc(sizeof(int) * (n + 1))	;
	for (int i = 1; i < n+1; ++i)
	{
		x[i] = 1;
	}
	x[1] = n;
	m = 1;
	h = 1;
	printf("%d\n", x[1]);
	while (x[1] != 1){
		if(2 ==x[h]){
			m++;
			x[h] = 1;
			h--;
		} else {
			r = x[h] - 1;
			t = m - h + 1;
			x[h] = r;
			while (t >= r){
				x[++h] = r;
				t -= r;
			}
			if (0 == t)
			{
				m = h;
			} else {
				m = h + 1;
				if(t>1)
					x[++h] = t;
			}
		}
		for (int i = 1; i <=m ; ++i){
				printf("%d ", x[i]);
			}
		printf("\n");		

	}
}

int main(int argc, char const *argv[])
{
	/* code */
	part(9);
	return 0;
}