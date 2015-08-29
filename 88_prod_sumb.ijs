clear ''
9!:3 [2 5
NB. multiset partition

loops =: 3 : 0
  NB. a1 -> a2.  a1 mean [int], a2 means [[int]]
  NB. return { v | v <| y } where <| means componentwise less equan than.
  if. 1 = #y do.
  	i. >: y
  	return.
  end.
  ,/(i. >: 0{y ) (,."0 0 2) loops }. y
)

assert 0 1 2 -: loops 2
assert (4 2 $ 0 0  0 1  1 0   1 1) -: loops  1 1

NB. return 1 if x lexicographical large than y, _1 is less than. 0 is equal
cmp =: 4 : 0
:
	assert (#y) = #x
	if. 0 = #x  	 do. 0 return. end.
	if. (0{x) > 0 {y do. 1 return. end.
	if. (0{x) < 0 {y do. _1 return. end.	
	(}. x) 	cmp }. y	
)
assert _1 = 1 2 cmp 2 0 
assert 1 =  2 cmp 1
assert 0 = 1 cmp 1
assert 0 = '' cmp ''
assert 1 = 2 1 cmp 2 0
assert 1 = 2 1 cmp 1 9

NB. { v | v <| y and v < x } where <| means componentwise less equal than.
filter_loops =: 4 : 0
:
	( (_1&~:) @ (x & cmp )"1 # ]) }. loops y
)
assert (1 2 $ 1 0) -: 1 2 filter_loops 2 0
assert (2 2 $ 1 0 2 0) -: 2 0 filter_loops 2 0

all =: *./
zero =: 0&=

NB. vector partition of y filter with (< x)
NB. a1 -> a1 -> [box a2]
vec_partition =: 4 : 0
:
	empty =: '',<(0,#x) $ 1
	if. all zero y do. empty return. end.
	if. all zero x do. empty return. end.
	r =: ''
	for_v. x filter_loops y do.
		r =: r,  (v&,) (&.>)  v vec_partition y - v
	end.
	r	
)

v =: 0 1
x =: 3 0
y =: 0 1

assert '' = 3 2 vec_partition 0 0 
assert (1$ <1 2 $0 1) -:  3 2 vec_partition 0 1 
assert (0 2;2 2 $ 0 1) -: 3 0 vec_partition 0 2 


assert (1 0) -: 2 2 vec_partition 1 0
3 4 , 1 2 , 0 2 $ 1
x =: 0 2

NB. assert (< 2 2 $ 3 1 0 1)   -:  3 1 vec_partition 0 1

