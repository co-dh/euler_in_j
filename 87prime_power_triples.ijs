clear ''
9!:3 [2 5

NB. #{ x,y,z | x^2 + y^3 + z^4 <= 5e7, x,y,z in N}

s =: 50

n_smaller_primes =: (_1&p:) @ (+&0.5) @ <.
assert 3 = n_smaller_primes 5.5

NB. { p | p <=y and is prime }
smaller_primes =: p: @ i. @ n_smaller_primes
assert 2 3 -: smaller_primes 3
assert 2 3 -: smaller_primes 3.5
assert (1 $ 2) -:   smaller_primes 2
assert 2 3 -: smaller_primes 4.5
assert 2 3 5 -: smaller_primes 5

NB. { p^4 < y | p is prime} 
qs =: smaller_primes @ (^&0.25)
assert 2 3 = qs 100

NB. { z | z ^ 3 + y ^ 4 < x and z is prime } 
cubes =: (smaller_primes @ (^&(1%3))@(- ] ^ 4:))
assert 2 3 -: 100  cubes 2
assert (2 2 $ 2 3 2 0) -: (cubes qs) 100

s=: x: 5e7
s n_squares"_ 0 1 ,/ s (cubes ,. ] )"0 [ qs s

non_zeros =: ((0&~:) @ (*/))"1 # ]

x23 =:  non_zeros ,/ s (cubes ,. ] )"0 x: qs s

_1 p: %: s - +/"1    (_10{.x23)^"1] 3 4x

+/ s n_squares"_ 0 1  x23

squares =: (smaller_primes @ %: @ (-  +/ @: (^&3 4x) @ ] )) "1 
_10 {. s squares _2 { x23
_1 p: 541
p: 99 100 101

loop_is_easy =: 3 : 0
	r =. 0$0
	for_k. qs y do.
		for_j. y cubes k do.
			for_i. y squares j,k do.
				r =. r, +/ (i,j,k) ^ 2 3 4
			end.	
		end.
	end.
	r
)



#~.ns =. loop_is_easy 5e7

#ns

NB. #{n | n^2 + y0^3 + y1^4 <= x  and n are primes }
n_squares =: n_smaller_primes @ %: @ (- +/@ (^&(3 4)) @ ] ) 
assert 4 = 100 n_squares 2 2


2000 smaller_primes @ %: @ (- +/@ (^&(3 4)) @ ] )  2 2 

%: 2000 - 8 + 4

sols =: 3 : ' +/ (squares&y)"0 cubes y'
NB. +/ sols"0[ smaller_primes  s ^ 0.25

_1 p: (^&(1%3)) 5e7 - 83 ^4x NB. 2.541679e6
NB. 32 primes cubes


