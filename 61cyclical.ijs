root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

p3 =: half @ (* inc )
t3 =: p3 45 + i.96

p4 =: sqr 
t4 =: p4 32 + i.68

p5 =: half @ ( * (dec @: (3&*)))
t5 =: p5 26 + i. 56

p6 =:  * (dec @: (2&*))
t6 =: p6  23 + i.48

p7 =:  half @ ( * ((5&*) - 3:))
t7 =: p7  21 + i.43

p8 =:  * ((3&*) - 2: )
t8 =: p8 19 + i.40 

last2 =: _2 &{. @: digits 
last2 1234

first2 =: 2 &{. @: digits
first2 1234

connect =:  *./ @:((last2@[) = (first2@])) 

connected =: 4 : 0
	r =. ''
	for_i. > x do.
		for_j. > y do.
			i1 =. _1 { i
			j1 =. 0  { j
			assert. 1 = #i1 
			assert. 1 = #j1 
			if. i1 connect j1 do.
				r =. r,  ,: i1, j
			end.
		end.
	end.
	<}.r
)

ht =: 3 : 0
	if. 6 ~: $ y do.
		0
	elseif. (_1{y) connect 0{y do.	
		1
	elseif. 1 do.
		0	
	end.
)

}. 1 2 3


ts =: (< @: |: @: ,: @: >)"0 t8;t7;t6;t5;t4;t3

cd =: connected

loop =: 3 : 0
	for_i. i. !5 do.
		a =. cd / i A. ts
		echo i
		echo a
		for_r. > a do.
			if. ht r do.
				echo 'found'
				echo i
				r
				return.
			end.
		end.
	end.
)

echo loop 0


