clear ''
9!:3 [2 5

ndigits =: >. @: ^.
zero_to_1 =: (]`>: @. (0&=)) NB. convert 0 to 1, others unchnaged
digits =: (($&10 @: >: @: <. @: (10&^. @: zero_to_1)) #: ])"0

tenx =: ($&10) @: $
undigits =: (#.~ tenx)

dups =: 3 : 0
	d =. sort y
	r =. ''
	for_i. i. <: #d do.
		if. (i{d) = (>:i) { d do.
			r =. r,i{d
		end.
	end.
	r
)
ds =: 5 6 0 0 3
assert 0   = dups ds
assert 0 0 -: dups 5 0 0 0 3

replace =: 4 : 0
	NB. replace x's y0 with y1
	['p r' =. y
	(x * p ~: x) + r * p = x
)

assert 5 6 2 2 3 -: ds replace 0 2
assert 0 0 0 7   -: 2 2 0 7 replace"1 [ 2 0

n_primes =: +/ @ (1&p:) @ undigits @ ( replace"1   (,.&(i.10)) @ ] )
assert 7 = ds n_primes 0

find1 =: 3 : 0
	i =. 0
	while. 1 do.
		i =. >: i
		ds =. digits p: i
		NB.if. 0 = 1000 | i do. 		echo ds	end.	
		for_d. dups ds do.
			NB. ignore the case that the duplicated digit is the first digit
			if. 0 = ds i. 0 { d do. continue.	end.
			echo ds
			n =. ds n_primes 0{d
			if. n > 7 do.
				ds
				return.
			end.
		end.
	end.
)
echo find1 0
