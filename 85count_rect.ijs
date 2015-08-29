root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

NB. the total number is N =  w(w+1) * h(h+1) /4. 
NB. find integer where  | N - 2e6 is minimum
NB. w = sqrt (0.25 + 8e6 %  h*h + h ) - 0.25
NB. delta =. w * (w+1) * h * (h+1) - 8e6

w =: 3 : 0
	[r =. _0.25 + %: 0.25 +  8e6 % y + *: y
	[<. / | _8e6 + */"1 (* >:) ((<. r), >. r) ,. x: y
)

y =. 10

ww =: 3 : 0 
	[r =. _0.25 + %: 0.25 +  8e6 % y + *: y
)

>./ ww 1 + i.2000

y=. 10

w 1

*: 27 

[idx =.  (i. <./ )dis =: w each 1 + i.2000
<./ dis

_10 {. dis 

y =. 2828
*: 2828

_4e6 + +/(* >:) 1999 30

30 * 1999
w each 1 + i.10
w 2e6 -1
y=. 2e6 -1
w each 100 + i.30
y =. 324
1973 * 324
(half 324 * 325x)+ half 1973 * 1974x 

* half (1999 * 2000x )

2 * 1999
w 1414
%: +: %: 2e6
y =. 36
ww 36

(36 * 37 * 77 * 78x) % 4
36 * 77



