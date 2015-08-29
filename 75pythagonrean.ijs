root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

base =: 3 4 5
t1 =: 3 3 $ 1 _2 2   2 _1 2   2 _2 3
t2 =: 3 3 $ 1 2 2   2 1 2    2 2 3
t3 =: 3 3 $ _1 2 2  _2 1 2   _2 2 3

t =: (t1 ,: t2 ), t3
d =: dot"0 2 1/
t1 =: t d  base

td =: (t &d)
td^:3 base 

NB.,+/"1 td^:1  base
NB. lens =: sort (-.&0),+/"1 td^:(1 + i.10)  base 

NB. the other way of generate
gen =: 3 : 0
	r =. 0 3 $ 0
	for_m. 2 range 1 + <. sqrt y % 2 do.
		for_n. 1 range m do.
			if. even m-n do. continue. end.
			if. not 1 = m +. n do. continue. end.
			p =. *: m,n
			a =. -/p
			b =. 2*m *n
			c =. +/p
			r =. r, a,b,c
		end.
	end.
)

ps =:  gen 1.5e6 NB. all primary pythagonrean triple
lens =: sort +/"1 ps

divide =: (0&=@|)"0
smaller =: {.& lens @ inc @ (lens &I.)  
one_sol =: 1&= @ (+/) @ (smaller divide ])"0 

NB. +/one_sol i.1.5e6
assert one_sol 12 
main =: 3 : 0
	r =. 0
	for_i. y do.
		echo i,r
		r =. r + one_sol i
	end.
	r
)


10 {. lens

limit =: 1.5e6
NB. for each lenght in lens, put k * length in sols [ k * length ] ++

multiples =: 4 : 'y * 1 range 1 + <. x % y' NB. return all multiples of y below x
assert 3 6 9 12 = 12 multiples 3

incs =: 4 : 'sols =. (1 + (x multiples y) { sols) (x multiples y) } sols'

fill_all =: 3 : 0
	sols =: (1 + limit) $ 0 + 0  NB. number of solutions for each integer
	for_i. lens do. 
		sols =. (1 + (limit multiples i) { sols) (limit multiples i) } sols
	end. 
	sols
	
)
res =: fill_all 0
+/1 = res


