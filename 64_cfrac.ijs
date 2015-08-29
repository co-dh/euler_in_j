root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

cfract =: 4 : 0
	NB. return first x digits of y's continued fraction
	r =. ''
	for_i. i.x do.
		r =. r, <. y
		echo y
		y =. % (- <.) y
		if. _ = y do. break. end.
			
	end.	
	r
)
rec_frac =:  (% @: (- <.))
step =: 3 :  '(detail y), (<. _1 { y)  , rec_frac _1 { y'
last_is_num =: 3 : '_ ~: _1 { y'

cfract2 =: 3 : ' step^:(last_is_num and ((40&>) @: #)) ^:_ y '
cfract2 each  sqrt 2 + i.100

NB. http://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Continued_fraction_expansion
cf =: 3 : 0
	m =. 0
	d =. 1
	a0 =. a =. <. sqrt y
	r =. a
	while. 1 do.	
		m =. (d * a) - m
		d =. (y - *: m) % d
		a =. <. (a0 + m) % d

		r =. r,a
		if. a = 2 * a0 do.
			r
			return.
		end.
	end.	
)
ns =: (1 + i.10000) set_diff (*: 1 + i.100)
+/ odd (# @: dehead @: cf)each  ns
