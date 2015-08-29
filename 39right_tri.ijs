p =: 120

rt =: 4 : 0
	 (2 * p * x + y)= (*: p) + 2 * x * y  
)

rts =: 3 : 0
	p =: y
	r =: 0$0
	for_i. i. >. y % 3
	do. 
		for_j. i + i.(- i) + >. y % 2
		do.
			if. i rt j
			do. r =: r, i;j
			end.  
		end.	
	end.	
	if. 0 < $ r do. echo y; r end.
	r	 	 
)

foo =: 3 : 0
	for_p. i.1001
	do. 
		rts p
	end.
)
foo 0

