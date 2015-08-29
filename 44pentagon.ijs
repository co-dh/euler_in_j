is_pan =: (5&=) @: (6&|) @ %: @: >: @: (24&*)

pent =: -: @ (* ((3&*) - 1:))

find =: 3 : 0
	for_i. 1 + i.y 	do.
		echo i
		a =. pent 1 + i
		b =. pent i
		if. (is_pan a + b) *. is_pan a - b do.
			echo 'fount'
			i
			return.
		end.
	end.
)
find 100000


