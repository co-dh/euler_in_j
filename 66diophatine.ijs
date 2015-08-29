root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

NB. this one is not working because sqrt returns float.
dio =: 3 : 0
	if. (= <. ) sqrt y do.
		0
		return.
	end.
	D =. y
	y =. 0
	while. 1 do.
		y =. y + 1
		x =. sqrt 1x + D * sqr y
		if. x = <. x do.
			x
			return.
		end.
	end.
)


NB.echo dio each 2 3 4 5 6 7 
NB. ds =: dio each 1 + i.1000

con_frac_of_sqrt =: 3 : 0
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


next =: 4 : ' ((1&{) , (0&{) + ((x&*) @: (1&{)))  y'

convergent =: 3 : 0
	D =. y
	y =. con_frac_of_sqrt y
		
	NB. y : y0; y1 y2 ... yn , while y1 .. yn is repeated.
	'y0 y1' =. 2 {. y
	up =. y0, 1 + y0*y1
	down =. 1,y1
	
	repeated =. dehead y
	len_r =. #repeated
	ai =. len_r | 1	
	while. 1 do.
		 if. 1 = (*: 1{up) - D * *: 1{down do. 
		 	(1{up), 1{down
		 	return.
		 end.

		a =. ai { repeated
		up =. a next up
		down =. a next down
		ai =. len_r | (ai + 1)
	end.
)

ns =: (1 + i.1000) set_diff (*: 1 + i.33)
$ns
xys =. convergent each x: ns
(i. >./) 0{"1 xys
635 { ns
convergent 661x
