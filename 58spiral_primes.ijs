
cat =: ,"0

cycle =: 3 : 0
	NB. start a cycle from row c, column y. y needs > c
	p1 =: }. (i: y) cat y
	p2 =: }. y cat i: -y
	p3 =: }. (i: -y)  cat - y
	p4 =: }. (-y) cat (i: y)
	pp =: p1,p2,p3,p4
)	

spiral =: 3 : 0
	w =: y
	sp =: (2 $ w) $ 0
	c =: <. -: w

	sp =: 1 (<c,c) } sp

	last =. 2
	for_i. (1 + i. c)
	do. 
		c1 =. c + cycle i
		n1 =. last + i.{.$c1
		sp =: n1 (<"1 c1) }sp
		last =. >:  {: n1
	end.
	sp
)

NB.(+/dia1) + +/dia2
find =: 3 : 0
	sp =: |. spiral y
	dia1 =:  (<"1 cat ~i.y)       { sp
	dia2 =:  (<"1 (i.y) cat i.-y) { sp
	0.1 > ((+/ @: (1& p:) ) % # )~. dia1 , dia2
)
NB. out of mem find  12007. 11007 => 0.111
dia =: 3 : 0
	r =. 1
	np =. 0
	for_i. 1 + i.y do.
		s =. *: 1 + 2 * i
		s =. s - i * 2 * i._4
		r =. r + 4
		np =. np + +/ 1 p: s
		if. 0.1 > np % r do.
			1 + 2 * i
			return.
		end.
	end.
	np % r
)
dia 14000

rat =: 3 : ' ((+/ @: (1& p:) ) % # ) y '


rat dia 13295
1 + 2 * 13295
