root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

cnt =: 3 : 0
	total =. 0
	for_i. 2 + i.y do.
		echo i
		for_j. (<.i%3) range (1+>.i%2) do.
			if. 1r2 <: j % i do. continue. end.
			if. 1r3 >: j % i do. continue. end.
			if. 1 = i +. j do.
				total =. inc total
			end.
		end.
	end.
	total
)

echo cnt 12000-1
