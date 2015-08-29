#include <stdio.h>
int sum = 100000000;
/*
int main(int argc, char const *argv[])
{
	for (int a = 20; a<21 ; ++a)
	{
		printf("%d\n", a);
		for (int b = 31; b<32 ; ++b)
		{
			//printf("%d %d\n",a, b);
			for (int c = 38; c < 39; ++c)
			{
				//printf("%d %d %d\n", a,b,c);

				for (int d = 39; d < 40;++d)
				{
					if(a+d==b+c) continue; 
					//printf("%d %d %d %d\n", a,b,c, d);
					for (int e = 40; e < 41; ++e)
					{
						if(!(a+e != b+c && a+e != b+d && a+e != c+d 
						&& b+e != c+d 
						&& d+e < a+b+c)) continue;	 
						
						//printf("%d %d %d %d %d\n", a,b,c, d, e);

						for (int f = 42; f < 43 ; ++f)
						{
							printf("%d %d %d %d %d %d\n", a,b,c, d, e, f);
							if(!(a+f!=b+c && 
							a+f!=b+d &&
							a+f!=b+e && 
							a+f!=c+d &&
							a+f!=c+e &&
							a+f!=d+e &&
							b+f!=c+d &&
							b+f!=c+e &&
							b+f!=d+e &&
							c+f!=d+e &&
							e+f<a+b+c &&
							a+b+f!=c+d+e&&
							a+c+f!=b+d+e&&
							a+d+f!=b+c+e&&
							a+e+f!=b+c+d&&
							b+c+f!=a+d+e&&
							1)){
								continue;
							} 
							for (int g = f+1; g < a+b; ++g)
							{
								printf("g: %d\n", g);
								int ag= a+g;
								if(	ag == b+c ||
									ag == b+d ||
									ag == b+e ||
									ag == b+f ||
									ag == c+d ||
									ag == c+e ||
									ag == c+f ||
									ag == d+e ||
									ag == d+f ||
									ag == e+f
									) continue;
								int bg = b + g;
								if( bg == c+d ||
									bg == c+e || 
									bg == c+f || 
									bg == d+e || 
									bg == d+f || 
									bg == e+f  
									) continue;

								int cg = c + g; 
								if( cg == d+e || cg == d+f || cg == e+f) continue;
								if(d + g == e + f) continue;
								if(f+g >=a+b+c) continue;
								int abg = a+b+g;
								if(abg == c+d+e || abg == c+d+f||abg == d+e+f||abg==c+e+f) continue;
								int acg = a+c+g;
								if(acg == b+d+e || acg == b+d+f || acg == d+e+f || acg == d+e+f) continue;
								int adg = a+d+g;
								if(adg == b+c+e || adg == b+c+f || adg == b+e+f || adg == e+e+f) continue;
								int aeg = a+e+g;
								if(aeg == b+c+d || aeg == b+c+f || aeg == c+d+f ||aeg == b +d +f) continue;
								int afg = a+f+g;
								if(afg == b+c+d || afg == b+c+e || afg == c+d+e || afg == b+d+e) continue;
								int bcg = b+c+g;
								if(bcg == a+d+e || bcg == a+d+f || bcg == d+e+f || bcg == a+e+f) continue;
								if(b+d+g == c+e+f) continue;
								if(b+e+g == c+d+f) continue;
								if(b+f+g == c+d+e) continue;
								int s1 = a+b+c+d+e+f+g;
								if(s1 < sum)
								{
									printf("%d = %d %d %d %d %d %d %d\n",s1, a,b,c, d, e,f,g);
									sum = s1;
								}
							}
						}
					}
				}
			}
		}
	}
	return 0;
}
*/

int main(int argc, char const *argv[])
{
	for (int a = 1; a<21 /*sum/6*/ ; ++a)
	{
		printf("%d\n", a);
		for (int b = a+1; b<32 ; ++b)
		{
			//printf("%d %d\n",a, b);
			for (int c = b+1; c < a+b; ++c)
			{
				//printf("%d %d %d\n", a,b,c);

				for (int d = c+1; d < a+b;++d)
				{
					if(a+d==b+c) continue; 
					//printf("%d %d %d %d\n", a,b,c, d);
					for (int e = d+1; e < a+b; ++e)
					{
						if(!(a+e != b+c && a+e != b+d && a+e != c+d 
						&& b+e != c+d 
						&& d+e < a+b+c)) continue;	 
						
						//printf("%d %d %d %d %d\n", a,b,c, d, e);

						for (int f = e+1; f < a+b ; ++f)
						{
							if(!(a+f!=b+c && 
							a+f!=b+d &&
							a+f!=b+e && 
							a+f!=c+d &&
							a+f!=c+e &&
							a+f!=d+e &&
							b+f!=c+d &&
							b+f!=c+e &&
							b+f!=d+e &&
							c+f!=d+e &&
							e+f<a+b+c &&
							a+b+f!=c+d+e&&
							a+c+f!=b+d+e&&
							a+d+f!=b+c+e&&
							a+e+f!=b+c+d&&
							b+c+f!=a+d+e&&
							1)){
								continue;
							} 
							for (int g = f+1; g < a+b; ++g)
							{
								int ag= a+g;
								if(	ag == b+c ||
									ag == b+d ||
									ag == b+e ||
									ag == b+f ||
									ag == c+d ||
									ag == c+e ||
									ag == c+f ||
									ag == d+e ||
									ag == d+f ||
									ag == e+f
									) continue;
								int bg = b + g;
								if( bg == c+d ||
									bg == c+e || 
									bg == c+f || 
									bg == d+e || 
									bg == d+f || 
									bg == e+f  
									) continue;

								int cg = c + g; 
								if( cg == d+e || cg == d+f || cg == e+f) continue;
								if(d + g == e + f) continue;
								if(f+g >=a+b+c) continue;
								int abg = a+b+g;
								if(abg == c+d+e || abg == c+d+f||abg == d+e+f||abg==c+e+f) continue;
								int acg = a+c+g;
								if(acg == b+d+e || acg == b+d+f || acg == d+e+f || acg == d+e+f) continue;
								int adg = a+d+g;
								if(adg == b+c+e || adg == b+c+f || adg == b+e+f || adg == e+e+f) continue;
								int aeg = a+e+g;
								if(aeg == b+c+d || aeg == b+c+f || aeg == c+d+f ||aeg == b +d +f) continue;
								int afg = a+f+g;
								if(afg == b+c+d || afg == b+c+e || afg == c+d+e || afg == b+d+e) continue;
								int bcg = b+c+g;
								if(bcg == a+d+e || bcg == a+d+f || bcg == d+e+f || bcg == a+e+f) continue;
								if(b+d+g == c+e+f) continue;
								if(b+e+g == c+d+f) continue;
								if(b+f+g == c+d+e) continue;
								int s1 = a+b+c+d+e+f+g;
								//if(s1 < sum)
								{
									printf("%d = %d %d %d %d %d %d %d\n",s1, a,b,c, d, e,f,g);
									sum = s1;
								}
							}
						}
					}
				}
			}
		}
	}
	return 0;
}


//19 30 37 38 39 41 44
//19303738394144