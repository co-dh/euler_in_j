root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

add2sq =: + (dbl @: sqr)
7 add2sq 1 2
decom =: 3 : 0
	for_n. (1 + i. ceiling sqrt half y) do.
		for_p. 1+ i.y do.
			if. is_prime p and y = p add2sq n	do.
				1
				return.
			end.
		end.
	end.
	0
)

find1 =: 3 : 0
	i =. 9
	while. 1 do.
		i =. i + 2
		if. is_prime i do.
			continue.
		end.
		if. not decom i do.
			i
			return.
		end.	
	end.
)
echo find1 0
decom 5777
