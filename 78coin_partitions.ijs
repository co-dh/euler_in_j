rec=: - (-: (*"1) _1 1 +/ 3 * ]) @ (>:@i.@>.@%:@((2%3)&*))

pens =: (1+1e6) $ 0-0
pens =: 1 (0) } pens

fill1 =: 3 : 0
	i =. 0
	while. i < y do.
		if. 0 = 1000 | i do. echo i end.
		[i =. >: i
		[idx =. rec i
		read =.  ({&pens) ` 0:  @. (<&0) 
		[v =. > read each idx
		[pn =. 1e6 | -/ +/ v
		if. 0 = pn do.
			echo 'found'
			echo i
			i
			return.
		end.
		[pens =: pn i } pens
	end.
	y {. pens
)

fill1 100000
