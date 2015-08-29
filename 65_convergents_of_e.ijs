root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

wrap1 =. 1: , ] , 1:
wrap1 3

cfe =. 2, ,wrap1 each 2 * 1 + i.40x


ff =: 3 : 0
	r =. 2 
	u =. 2 3
	for_a. 2 dehead cfe do.
		'm n' =. u
		r =. r, n
		u =. n, m + a * n	
	end.
	r
)

+/digits 99 { res =.  ff 0

NB. seq =: (+%) / \cfe
