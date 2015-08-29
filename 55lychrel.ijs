root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'
rev_add =: [ + undigits @|. @ digits 
pal 1 2 1
np =: 3 : 'not pal digits y'
np 121
NB. rev_add^:(np) ^:_ [ 790x

is_lychrel =: 3 : 0
	i =. 0
	while. i < 51 do.
		i =. i+1
		y =. rev_add y	

		if. pal digits y do.
			0
			return.
		end.	
	end.
	1
)

assert  is_lychrel 196
assert is_lychrel 4994
echo  +/ (is_lychrel each)  1 + i.9999x
NB. 
NB. rev_add^:i.20 ] 790x
