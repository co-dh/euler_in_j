#include <stdio.h>
#include <stdlib.h>
#include <memory.h>

void part0(int n)
{
	int m,h,r,t;
	int *x = (int*)malloc(sizeof(int) * n )	;
	for (int i = 0; i < n; ++i)
	{
		x[i] = 1;
	}
	x[0] = n;
	m = 0;
	h = 0;
	printf("%d\n", x[0]);
	while (x[0] != 1){
		if(2 ==x[h]){
			m++;
			x[h--] = 1;
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
		for (int i = 0; i <m ; ++i){
				printf("%d ", x[i]);
		}
		printf("\n");		

	}
}

typedef int (*visitor)(int* a, int end);

//
int part(int n, visitor f)
{
	//visit each partition of n. if f return true, break
	int k = 2;
	int x,y,i;
	int size = sizeof(int) * n + 3;
	int * a = (int*) malloc(size);
	int result = 0;
	memset(a, 0, size);
	a[2] = n;
	while(k!=1) {
		y = a[k--] - 1;
		x = a[k] + 1;
		while(x <= y){
			a[k++] = x;
			y -= x;
		}
		a[k] = x+y;
		result = (*f)(a, k);
		if(result){
			break;
		}
	}
	free(a);
	return result;
}

int print(int *a, int size){
	int i;
	for(i=1; i< size+1; i++){
		printf("%d ", a[i]);
	}
	printf("\n");
	return 0;
}


int gk=0, gn =0;
int check_prod(int *a, int size){
	if(size > gk)
		return 0;

	int prod = 1;
	for (int i = 1; i <= size; ++i)
	{
		prod *= 1 + a[i];
	}
	printf("  a: ");
	print(a,size);
	printf("  prod: %d == %d, gk:%d, size:%d\n", prod, gk + gn, gk, size);
	return prod == gn + gk;
}


int prod_sum(int k){
	int n = 0;
	printf("k: %d\n", k);
	while(++n ){
		printf("k: %d  n+k: %d\n", k,n+k);
		gk = k; //gk and gn are used by check_prod
		gn = n;
		if(part(n, check_prod))
			return n+k;
	}
	return 0;
}


int filter(int *a, int size){
	print(a, size);
	return 0;
}


int main(int argc, char const *argv[])
{
	int a = atoi(argv[1]);
	printf("result : %d %d\n", a, prod_sum(a));
	//part(a, filter);
	return 0;
}