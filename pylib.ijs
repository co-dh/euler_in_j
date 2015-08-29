root =: '/home/hdeng/jscripts/'
NB. load root,'pylib.ijs'


index_in =: = i. 1:
ndigits =: >. @: ^.

zero_to_1 =: (]`>: @. (0&=)) NB. convert 0 to 1, others unchnaged
digits =: (($&10 @: >: @: <. @: (10&^. @: zero_to_1)) #: ])"0

tenx =: ($&10) @: $
undigits =: (#.~ tenx)

is_meet =: +./ @: e. &: digits
meet =: ~. @: (e. # [)
diff =: (-. @: e.) # [ 
index_in =: = i. 1:
del_index =: ({. , (}. @: }.))
del_from =: index_in del_index ]
dd =: del_from digits
NB.tens =: ((0&=) @: (_1&{) @ digits)"0
tens =: (0&=) @: (10 & | )

del =: ({. , (}. @: }.))~

digit_factorials =: ((+/ @: ! @: digits) = ] )"0

all_rotation =: ((|."1 0 1~) (i. @: $))

pal =: *./ @: (|. = ])

EV     =: `: 6 NB. adverb. evoke gerund to train. (f ` , ` g) EV
APPEND =: `: 0 NB. adverb. (f ` g ) APPEND x = (f x) ; g x
abs    =: + ` - @. (<&0)
NB. G @. I = (I { G) EV
NB. G/X  means x0 f x1 g x2 h x3 ... where G =: f`g``h
double =: +:
eighttimes =: (double ^: 3)
NB. (u ^: v) y means u ^ (v y) y the number of iterations is v y

NB. fib sequence
fib 		=: , sumlast2
sumlast2 	=: +/ @ last2
last2 		=: _2 & {.
minus2 		=: -&2
const01 	=: 3 : '0 1'
FIBS 		=: fib ^: (minus2 ` const01)  NB. means u^:(v1 y) (v2 y). v1 y is iter, v2 y is init val
NB. x u ^: k y means (x&u) ^: k y, k is a constant.
NB. x u ^: (U`V`W`) y means (((x U y) &u) ^: (x V y)) ( x W y) , or U ( u ^: V) W
NB.          U  bind with u, V for iteration, W for init value.
NB. x (U`V`W) } y means (x U y) (x V y) } (x W y)
NB.  (f @ g) y mean (f @: g)"G y , where G =: 0 { (g b. 0)   where g b. 0 is g's rank.
perms =: (i. & !) A. i.
dehead =: }.
detail =: }:

dec =: <:
inc =: >:
dbl =: +:
half =: -:
sqr =: *:
sqrt =: %:
floor =: <.
ceiling =: >.

tri =: half @: * inc
is_tri =: 1&= @: (2&|)"0 @: sqrt @: inc @: ((8&*)"0)

pent =: half @: (* (dec @:(3&*)))
is_pent =:  5&= @: (6&|)"0 @: sqrt @: inc @: ((24&*)"0) 

hexagonal =: * (dec @: dbl)
is_hex =: 3&= @: (4&|)"0 @: sqrt @: inc @: ((8&*)"0)

not =: -.
or =: +.
and =: *.
is_prime =: 1&p:
nprimes_lt =: _1&p:


prime_factors =: q:
distinct =: ~.

sort =: /:~ 

last_index_of =: i:
each =: "0
              

display_box =: (9!:3 )2 NB.1 atomic, 2 boxed, 4 tree, 5 linear, 6 paren.

NB. file
write =: 1!:2  NB. y can be file handle 2 for stdout, or boxed file name
read  =: 1!:1
display =: write &2
loaded_scripts =: 4!:3 

arrbin =: 3!:1 NB. array to binary rep
binarr =: 3!:2 

split =: < ;. _2
join =: ; @: (,&LF &. >)

transpose =: |:
itemize =: ,:
dot =: +/ . *


pa     =: ('('&,) @: (,&')')   
cp     =: [ ` pa @. (+./ @: ('+-*' & e.))
symbol =: (1 : (':';'< (cp > x), u, (cp > y)'))(" 0 0)

splus  =: '+' symbol 
sminus =: '-' symbol 
sprod  =: '*' symbol 
sprodc =: '' symbol
sdot =: splus / . sprodc
de_rational =: 2&x:
in =: +/ @: ss
rm_from =: (~: # ])" 0 0 1

select =: 4 : 0
	NB. [] -> int ->[[y]]   .from x, select y elements 
	if. y = 1  do.
		x
		return.
	end.
	r =. ''
	for_i. x do.
		rest =. i rm_from x
		r =.r, i ,."0 0 _ rest select y - 1
	end.
	dehead r
)


set_diff =: ((not@e.) # [)"1
odd =:  (1&=) @ (2&|)
even =: (0&=) @ (2&|)
totient =: 5&p:


is_perma =: 4 : 0
	x =. sort ": x
	y =. sort ": y
	if. (#x) ~: #y do.
		0
		return.
	end.
	*./ x = y	
)
is_perm =: is_perma"0

range =: 4 : 0
	if. x > y do. '' return. end.
	x + i.(y-x)
)

type =: 3!:0
mem_limit =: 9!:20 

free_space =: 7!:3 
current_space =: 7!:0
space_required =: 7!:2 
size_of =: 7!:5

sparse_default =: 3 & $.
sparse_to_dense =: 0&$.
sparse_new =: 1&$.

timeit =: 6 !: 2  NB. string -> seconds

replace=: 4 : 0
 'p q'=. y
 j=. p nosindx x
 if. ''-:j do. x return. end.
 d=. p-&#q
 k=. (j+(0>.-d)*i.#j)+/i.#q
 select. *d
  case.  1 do. (0 (j+/(#q)+i.d)}1$~#x) # q k}x
  case.  0 do. q k}x
  case. _1 do. q k} (0 (d{."1 k)}1$~(#x)+(#j)*|d) #^:_1 x
 end.
)

nosindx=: 4 : 0
 s=. x I.@E. y
 i=. s I. s+#x
 (i.&_1 {. ]) (s,_1) {~ (i,_1) {~^:a: 0
)
