root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'
fname =: root,'poker.txt'
cut =: (< ;. _2)
data =: cut fread < fname

d0 =: > 0 { data
5 _5 {."0 0 1 i.10
'l r' =: sort"2 '  23456789TJQKA     CDHS' i. a=: > 5 _5 {."0 0 1 cut d0,' '

flush =: 3 : '1 = # distinct 1 {"1 y'
assert 1 = flush 3 2 $ 1 1 2 1 3 1

straight =: (*./ @: ([ = (((i.5)& +) @: (0&{)) )) @: (0 &{"1)

royal =: 3 : '*/ 10 11 12 13 14 = 0 {"1 y'

rf =. 5 2 $ 10 1 11 1 12 1 13 1 14 1
assert royal rf

royal_flush =: royal and flush
assert royal_flush rf

f =. 5 2 $ 10 1 11 1 12 1 13 1 14 2
assert not royal_flush f

straight_flush =: straight and flush
assert straight_flush rf

distinct 0 {"1 [ 5 2 $ 1 3 2 2 3 5 4 9 5 7

eq01 =: 0&{ = 1&{
eq03 =: 0&{ = 3&{
eq14 =: 1&{ = 4&{

eq12 =: 1&{ = 2&{
eq23 =: 2&{ = 3&{
eq02 =: 0&{ = 2&{
eq13 =: 1&{ = 3&{
eq34 =: 3&{ = 4&{
eq24 =: 2&{ = 4&{

k4 =: 3 : '(eq03 or eq14) sort 0 {"1 y'

assert     k4 5 2 $ 1 1 1 2 1 3 2 4 1 4
assert not k4 5 2 $ 1 1 2 2 1 3 2 4 1 4
assert     k4 5 2 $ 3 1 3 2 3 3 2 4 3 4

k3 =: 3 : '(eq02 or eq13 or eq24 ) sort 0 {"1 y'

full_house =: 3 : '((eq02 and eq34) or (eq01 and eq24)) sort 0 {"1 y'
assert full_house 5 2 $ 1 0 2 3 2 4 1 1 1 2
assert full_house 5 2 $ 3 0 2 3 2 4 3 1 3 2

two_pairs =: 3 : '((eq01 and eq23) or (eq12 and eq34) or (eq01 and eq34) )sort 0 {"1 y'
assert two_pairs 5 2 $ 1 0 4 0 3 0 4 0 1 0

one_pair =: 3 : '4 = # distinct  sort 0{"1 y'
assert one_pair 5 2 $ 3 0 4 0 3 0 2 0 1 0

rank =: 3 : 0
	s =. \:~ 0 {"1 y

	if. royal_flush y do.
		9 0 0 0 0 0
	elseif. straight_flush y do. 
		m =. 0 { s
		8 ,m, 0 0 0 0
	elseif.  k4 y do.
		if. eq03 s do.
			7, (0{s), (4{s),0 0 0
		else. 
			7, (4{s), (0{s),0 0 0
		end.
	elseif. full_house y do.
		if. eq02 s do.
			6, (0{s), (4{s),0 0 0
		else.
			6, (4{s), (0{s),0 0 0
		end.		
	elseif. flush y do.
		5,s
	elseif. straight y do.
		m =. 0 { s	
		4, m, 0 0 0 0
	elseif. k3 y do.
		if. eq02 s do.
			3, (2 3 4  {s),0 0
		elseif. eq13 s do.
			3, (1 0 4 {s), 0 0
		elseif. 1 do.	
			3, (2 0 1 {s), 0 0		
		end.
	elseif. two_pairs y do.
		if. (eq01 and eq23) s do.
			2,(0 2 4 { s), 0 0 
		elseif. (eq01 and eq34) s do.
			2,(0 3 2 { s), 0 0 
		elseif. 1 do.
			2,(1 3 0 { s), 0 0 
		end.				
	elseif. one_pair y do.
		if. eq01 s do.
			1, (1 2 3 4{s), 0
		elseif. eq12 s do.
			1, (1 0 3 4{s), 0
		elseif. eq23 s do.
			1, (2 0 1 4{s), 0
		elseif. 1 do.
			1, (3 0 1 2{s), 0
		end.
	elseif. do.
		0,s 
	end.
)

NB. a =: sort"2 '  23456789TJQKA     CDHS' i. a=: > 5 _5 {."0 0 1 cut d0,' '

cards =: '  23456789TJQKA     CDHS'
hands =: 3 : 0  
	sort"2 cards i. > 5 _5 {."0 0 1 cut y,' '
)


assert (2 6 $ 7 5 7 0 0 0 7 5 6 0 0 0) = rank"2 hands '5H 7H 5H 5H 5H 5H 6H 5H 5H 5H'
assert (2 6 $ 9 0 0 0 0 0 4 0 0 0 0 0) = rank"2 hands 'TH JH QH KH AH TH JS QH KH AH'
assert (2 6 $ 8 13 0 0 0 0 8 6 0 0 0 0)= rank"2 hands '9H TH JH QH KH 2S 3S 4S 5S 6S'
assert (2 6 $ 6 3 2 0 0 0 6 3 4 0 0 0)=rank"2 hands '3H 3H 2H 3H 2H 3H 3H 4H 3H 4H'
assert (2 6 $ 5 14 8 5 3 2 5 13 11 10 9 8) = rank"2 hands '3H AH 8H 5H 2H 9S 8S TS JS KS'
assert (2 6 $ 4 6 0 0 0 0 4 12 0 0 0 0 ) = rank"2 hands '3H 4H 6S 5H 2H 9S 8S TS JS QH'
assert (2 6 $ 3 3 4 2 0 0 3 9 7 6 0 0) = rank"2 hands '3H 3H 3S 4H 2H 9S 9S 9S 7S 6H'
assert (2 6 $ 2 4 3 2 0 0 2 9 7 8 0 0) = rank"2 hands '3H 3H 2S 4H 4H 9S 9S 8S 7S 7H'

>/ /: rank"2 hands '5H 5C 6S 7S KD 2C 3S 8S 8D TD'
>/ /: rank"2 hands '5D 8C 9S JS AC 2C 5C 7D 8S QH'
>/ /: rank"2 hands '2D 9C AS AH AC 3D 6D 7D TD QD'
>/ /: rank"2 hands '4D 6S 9H QH QC 3D 6D 7H QD QS'
>/ /: rank"2 hands '2H 2D 4C 4D 4S 3C 3D 3S 9S 9D'
p1win =: 3 : '>/ /: rank"2 hands y'
+/p1win"1  >  data



