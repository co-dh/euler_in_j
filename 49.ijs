root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

is_geo =: 3 : 0
	as =: (i. ($y) - 2) +/ i.3
	0 e. (+/"1) 1 _2 1 (*"1) as { y
)

pp =: 3 : 0
	dy =. digits y
	if. 0 e. dy do.
		0
		return.
	end.
	ps =. sort (is_prime # ])distinct undigits (i.!4) A. dy
	if. 3 > $ps  do.
		0
		return.
	end.
	is_geo ps
)

echo (pp"0 # ] )1000 + i.9000
y =: 2699

ps

NB.(is_prime # ])undigits (i.!4) A. digits 1009
NB.pp 1009


is_geo a
