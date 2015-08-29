root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

su =: 3 3 3 3 $ 0 0 3 9 0 0 0 0 1   0 2 0 3 0 5 8 0 6  6 0 0 0 0 1 4 0 0    0 0 8 7 0 0 0 0 6   1 0 2 0 0 0 7 0 8    9 0 0 0 0 8 2 0 0    0 0 2 8 0 0 0 0 5   6 0 9 2 0 3 0 1 0    5 0 0  0 0 9  3 0 0

y =: ,/"1 / ,"2/ su

NB. 1 2 -> 1 . return  y[x[0]]
row =: 4 : '(0{x) { y '
NB. 1 2 -> 1 . return  column x[1] of y
col =: 4 : '(1{x) {"1 y'

xys =: ,"2/ ,"0/~ i.9 NB. 0..9 cross production 0..9

NB. 1 2 -> 1. Return all elements of the 3X3 block that contains x in sudoku y
block =: 4 : 0
:
	(<"1(((-:&(<. x%3) )@:<.@(%&3))"1 # ] ) xys) { y
)

NB. 1 2 -> 1. find all possible solutions of x position at sudoku y
possible =: 4 : '((i.10) -. ((row&y) , (col&y) , (block&y)) ) x ' 

NB."1 2 -> 0. Return True if y[x] == 0
at0 =: 4 : '0 = (<x) { y' 

solved =: 3 : '0 = +/ 0 = ,y'

NB. 2 -> 2. 
solve =: 3 : 0
	nonzero =. xys ( at0"1 1 2 # [) y 
	if. 0 = # nonzero do. y return. end.
	NB.1  the first position with smallest number of possible values.
	[least_possibles =. {. nonzero /: (#@>)"0 nonzero (<@possible)"_ 1 2 y 
	sols =. least_possibles possible y
	NB. try each solution from least_possibles sol =. 4
	for_sol. sols do.
		r =. solve  sol (<least_possibles) } y
		if. solved r do. 
			r return. 
		end.
	end.
    0
)
txt =: read <'/home/hdeng/jscripts/sudoku.txt'
results =: solve"2 ("."0 @ > @ }.)"1 [ 50 10 $split txt,LF
$results
first3 =: 3 : 'undigits 3 {. 0 { y'
+/ first3"2  results


