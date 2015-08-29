root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

NB. 1 0-> 0, count number of occurance of x in y
y =: 28
uniqfact =: ~. factors =: 3 p: y
count =:  (+/@:=)"_ 1 0
vec =: factors count uniqfact
nsols =: 3 : ' >.  -:  */ >: +: (count ~.) 3 p: y ' 

NB. 1 -> 2. given a vector a b c ..., return all combination of 0..a, 0..b, ...
comb =: 3 : 0
	if. 1 = # y do.
		,:"0 i. 0 { y
		return.
	else. do.
		
		for_n. i. {.y do.
			
		end.
	end.
	
)

4 5  (,"0 0 1)  ,:"0 i.3
4 5,"0 0 1  ,:"0 [ 1 2 3
