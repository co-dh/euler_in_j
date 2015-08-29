root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

sf =: +/ @: !@ digits
loop =: 3 : 0
	set =. next =. y
	next =. sf next
	while. not next e. set do.
		set =. set, next
		next =. sf next
	end.
	#set
)

cache =: (1 + 2e6) $ 1-1
cache =: 3 (169)}cache 
cache =: 3 (363601)}cache 
cache =: 3 (1454)}cache 

cache =: 2 (871)}cache 
cache =: 2 (45361)}cache 

cache =: 2 (872)}cache 
cache =: 2 (45362)}cache 

cached =: 3 : 0
	if. y >: #cache do.
		loop y
		return.
	end.
	c =. y { cache
	if. 0 = c do.
		next =. sf y
		if. next = y do.
			l =. 1
		else.
			l =. 1 + cached next
		end.	
		cache =. l y } cache
		l
	else.
		c	
	end.	
)
assert 3 = cached 169
assert 5 4 2 -: cached each 69 78 540
assert 3 2 2 5 4 2 -: cached each 169 871 872 69 78 540
find_all =: 3 : 0
	r =. ''
	for_i. i.y do.
		echo i
		if. 60 = cached i do.
			r =. r,i
		end.
	end.
	r
)
echo # chains =. (60&= @ cached each # ] )1 + i.1000000
NB. chains =: (60&= @ loop each # ] )1 + i.1000
NB. #echo # chains =: find_all 1000000

NB. load 'jpm'
NB. start_jpm_ ''
NB. cached each 1 + i.50
NB. showdetail_jpm_ 'cached'
