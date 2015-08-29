root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

nearest =: 3 : 0
	a =. (y * 3) % 7
	b =. (<. a) - (= <.) a
	b % y
)
echo >./ nearest each 2 + i.1000000x

