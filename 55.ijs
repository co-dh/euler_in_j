dec =: <:
inc =: >:
dbl =: +:
half =: -:
sqr =: *:
sqrt =: %:

s8 =: sqrt @: inc @: ((8&*)"0)

tri =: half @: * inc
is_tri =: 1&= @: (2&|)"0 @: s8

pent =: half @: (* (dec @:(3&*)))
is_pent =:  5&= @: (6&|)"0 @: sqrt @: inc @: ((24&*)"0) 

hexagonal =: * (dec @: dbl)
is_hex =: 3&= @: (4&|)"0 @: s8


is356 =: 3 : 0
	n =: pent y
	s =: s8 n
	(1 = 2 | s) *. 3 = 4 | s 
)

find_356 =: 3 : 0
	i =: y
	while. 1  do.
		i =: i + 1
		echo i
		if. is356 i do.
			echo 'found'
			i
			return.
		end.
	end.
)

echo find_356 165


is356  165              

pent 31977x
