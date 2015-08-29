root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

NB. out of mem # ~. ((1&<) # ]) ,%/~1+i.10000x
4 range 6

NB. the below is too time consuming, and impossible
cnt =: 3 : 0
	bits =. sparse_new ((y+1), (y+1)); 0 1; 1 = 0 
	for_i. 1 + i.y do.
		echo i
		for_j. 1 range i do.
			g =. i +. j
			'i j' =. (i,j) % g
			bits =. 1 (<i,j) } bits			
		end.
	end.
	bits
)

+/ totient 2 + i.1e6 -1
