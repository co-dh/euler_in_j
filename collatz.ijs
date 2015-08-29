even =. (0&=) @: (2&|)
odd  =. (1&=) @: (2&|)

next =: 3 : 0
	if. 1 = y 		do. 1
	elseif. even y	do. y % 2
	elseif. 1		do. 1 + 3 * y
	end.
)

NB. -:`(>:@(3&*))`1: @. (1&= + 2&|)

collatz =: 3 : 0
	r =. y
	while. y ~: 1
	do.	
		y =. next y
		r =. r,y
	end.	
	r	
)

ncollatz1 =: 3 : 0
	r =. 0 
	while. y ~: 1
	do.	
		y =. next y
		r =. r + 1
	end.	
	r	
)

ncollatz =: 3 : 0
	if. y = 1
	do. 
		1
	else.	
		if. even y
		do.
			1 + ncollatz y % 2
		else.
			1 + ncollatz 1 + 3 * y
		end.
	end.
)

cache =: 1000000$0

cn =: 3 : 0
	if. 0 ~: y { cache		
	do.
		y { cache
	else.
		r =. 
	end.	
)

set =: 4 : 0
	cache =: y (<x) } cache
)


nc =: 3 : 0
	if. y < $cache      
	do.
		if. 0 ~: y { cache	do.		r =. y { cache
		elseif. y = 1		do.		r =. 1
		elseif. even y		do.		r =. 1 + nc y % 2
		elseif.	1 			do.		r =. 1 + nc 1 + 3 * y
		end.

		y set r
	else.
		if. even y	do.		r =. 1 + nc y % 2
		else.		    	r =. 1 + nc 1 + 3 * y
		end.
	end.
	r
)

fillc =: 3 : 0
	i =. 1
	while. i < y
	do.	
		nc i
		i =. i+1
		echo i
	end.	
	i
)

NB. load root,'collatz.ijs'