root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

sqrt_digits =: 3 : 0
	[d =. 0          NB. d is the result
	
	while. 99 > 10 ^. d do.
		if. d = 0 do. 
			[n =. <. %: y
		else.
			[n =. <. y % 20 * d NB. n is next digit
			while. y < n * n + 20 * d	do.
				[n =. <: n
			end.
		end.
		[ y =. 100 * y - n * n + 20 * d
		assert y >: 0
		[d =. n + 10x * d
	end.
	d
)

assert 475 =  +/[s2 =: digits  sqrt_digits 2
ds =: +/ @ digits @sqrt_digits 
+/ ds each (1 + i.100) -. *: 1 + i.10

