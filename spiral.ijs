
cat =. ,"0

cycle =: 3 : 0
	NB. start a cycle from row c, column y. y needs > c
	p1 =: }. (i: y) cat y
	p2 =: }. y cat i: -y
	p3 =: }. (i: -y)  cat - y
	p4 =: }. (-y) cat (i: y)
	pp =: p1,p2,p3,p4
)	

fill =: 3 : 0
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
	dia1 =.  (<"1 cat ~i.y)       { sp
	dia2 =.  (<"1 (i.y) cat i.-y) { sp
	(+/dia1) + +/dia2
)


