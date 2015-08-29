clear ''

filter =: 4 : 0 
	MAX   =. x
	'x y' =. y	
	(x <: MAX) *. y <: +: x
)

NB. generate prime pythagonrean triples where max < y
gen =: 3 : 0
	r =. 0 2 $ 0
	for_m. 2 + i. >. y do.
		for_n. 1 + i.m-1  do.
			if. 0 = 2 | m-n do. continue. end.
			if. -. 1 = m +. n do. continue. end.
			p =. *: m,n
			a =. -/p
			b =. 2*m *n
			c =. +/p
			r =. r,((y&filter) #] ) 2 2 $a,b , b,a
		end.
	end.
	r
)

pys =: gen 100
assert 29 2 = $pys

[start =: (>. @ -: @ (1&{)) 
[end =: ((0&{) <. (<: @ (1&{))) 
[range =:  ([ + (i.@ >: @ (] - [)) ) 

se =: start range end
prime_sols =: ((0&{) ,.  se ,. ((1&{) - se))"1 
assert (3 3 $ 24 4 3 24 5 2 24 6 1) -: prime_sols 24 7



mult =: >:@i.@<.@(% 0&{) NB. multiples of y0 to 100.
assert 1 2 3 4 -: 100 mult 24 7

mults =: (] *"_ _ 0 mult)
assert 4 2 = $ 100 mults 24 7

n_prime_sols =: (1 + end - start)"1 
assert 3 = n_prime_sols 24 7

assert 34 = +/n_prime_sols"1 [ 100 mults 24 7
assert 34 = non_zero3,/prime_sols 100 mults 24 7
n_sol2 =: 3 : '+/n_prime_sols [ non_zero2,/(y&mults)"1 gen y'
assert 2060 = n_sol2 100
assert 1975 = n_sol2 99
n_sol2  1817

non_zero3 =: ((-.@-:)& 0 0 0)"1 # ]
non_zero2 =: ((-.@-:)& 0 0)"1 # ]
nsols =: 3 : '#non_zero3 ,/prime_sols"1 non_zero2 ,/(y&mults)"1 gen y '

assert 2060 = nsols 100  
assert 1975 = nsols 99

NB. brute force. out of memory
loop2  =. ,/ @ (,"0 /) 
loop3 =. (,/@ (,"0 0 1/)) 
loops =. (loop3 (loop2~))~ @: >: @ i.
short_perf =. (= <.)@ %: @ +/@: *: @ ({. , (+/ @ (_2&{.)))@ \:~
good =. (~.@: (\:~"1) @: (short_perf"1 # ]) @ loops ) 
NB. corr =. good 100
NB. assert 2060 3 = $corr
NB. corr -. wrong
