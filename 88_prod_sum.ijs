clear ''
9!:3 [2 5

part =: 3 : 'final (, new)^:y <<i.1 0'
new  =: (-i.)@# <@:(cat&.>) ]
cat  =: [ ;@:(,.&.>) -@(<.#) {. ]
final=: ; @: (<@-.&0"1&.>) @ > @ {:


non_zero =: (0&~:@(+/))"1  # ]

expand =: non_zero @ (*. =@i.@#) NB. convert 1 0 1 to 2 3 $ 1 0 0  0 0 1
rshift =: _1&(|.!._)
delta =: < rshift
add_1 =: ((+"1 expand@delta) @ (,&0))"1
collapse =: ~. @ non_zero@,/
next =: collapse @: add_1

lshift =: 1 &(|. !. 0)
y =: 5 0 0 
expand @(1&<) @ (- lshift) y



NB. apply u to x { y . 
mod =: 1 : 0 
:
	(u x{y) x } y
)
assert 2 2 3 -: 0 (>: mod) 1 2 3


next1 =: 3 : 0
	r =. (0, #y)  $ 0
	for_i. i. <: #y do.
		if. 1 < -/(0 1 + i) { y do. 
			r =. r,  i (<: mod) (>: i) (>: mod) y
		end.
	end.
	r
)

next2 =: ~. @:(,/)@:(next1"1)

all_zero =: (1&=)@(*./)@:(0&=) 
assert 1 = all_zero 0 0 0
assert 0 = all_zero 0 0 0 1

part2 =: 4 : 0
	NB. Nat -> Nat -> [[Int]]
	NB. return x's partitions whose number of parts <: y
	NB. { a | +/a = x , a is desc sorted , ai is positive int, #a = y }
	[start =. ,: x, (<: y) # 0 
	[new =. next2 start 
	[r =. start,new, next2 new
	end.	
	r
)

5 part2 3
x=: 5
y =: 3

next2 next2 next2 [ 1 3 $ 4 2 0

next1 4 1 0
~.,/next1"1  ,/next1"1 [ 1 3 $ 4 2 0
,"1/next1"1 [ 4 2 0

next1 3 3 0
next1 4 1 1

