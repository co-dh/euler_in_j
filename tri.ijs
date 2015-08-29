
tri =:  (%&2) @: (+&2 * >:)
ndiv =: +/ @ (0&=) @: ((1&+ @ i.) | ])"0
cnt =: (+/ @: =)"0 0 1
ndiv2 =: */ @ (1&+) @: (~. cnt ]) @: q:
tri500 =: 3 : 0
	a =. 1
	n =. (ndiv2 tri a)
	while.  n <: 500
	do. 
		a =. a + 1
		n =. (ndiv2 tri a)
		echo a,n
	end.
	a
)	


root =: '/home/hdeng/jscripts/' 