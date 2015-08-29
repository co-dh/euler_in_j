root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

prime_factors =: q:
distinct =: ~.

dpf =:  # @: distinct @: prime_factors NB. # distinct prime factors
dpf 644

NB. u ^: v ^: _

find =: 3 : 0
	i =. 2
	while. 1 do.
		i =. i + 1
		if. not 4 = dpf i do.
			continue.
		end.
		if. not 4 = dpf i+1 do.
			continue.
		end.
		if. not 4 = dpf i+2 do.
			continue.
		end.
		if. not 4 = dpf i+3 do.
			continue.
		end.
		i
		return.
		
	end.
)
~."1 q: 134043 + i.4
