root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'


is_pan =: 3 : 0
	y =. digits y
	(9 = $y) and (not 0 e. y ) and 9 = $ distinct y
)

pan =: 4 : 0
	r =. ''
	for_i. 1 + i.y do.
		r =. r, digits x * i
	end.
	undigits r
)


a =: (1 + i.9999x) (pan"0 0 0)/ 2x + i.4


b =: (1 + i.3x) (pan"0 0 0)/ 2x + i.4

pans =: ((, @: (is_pan each)) #] ),a
>./pans


is_pan each , 3 4 (pan"0 0 0)/ 4 5

8 9 (pan"0 0 0)/ 4 5

NB. (1+i.10) (pan"0 0 0)  4 
