root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

set =: sort @: distinct @: digits 

pm =: 3 : '*./ =/ set each (2 + i.5) * y'
pm1 =: 3 : '*./ 0 = , ((-"1) 0&{)set each (2 + i.5) * y'

find1 =: 3 : 0
	i =. 0
	while. 1 do.
		i =. i + 1
		if.  pm1 i do.
			i
			return.
		end.
	end.
)

echo find1 0



