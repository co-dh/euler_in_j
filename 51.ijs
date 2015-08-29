root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'
7 < +/ is_prime undigits 1 , each i.10
p: 4+ i.5

NB. replace x's yth digit with 0 to 9
replace =: 4 : 0
	dx =. digits x
	if. y >: # dx do.
		0
	else.
		6 < +/ is_prime undigits (i.10) (y })"0 0 1 dx
	end.
)


(((replace"0)&5) # ])    (p: 25 + i. 100000) 

p: 25 + i.25


undigits (i.10) (0 })"0 0 1 digits 17 
