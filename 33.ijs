digits =: 10 10 & #: 

result =: 0 $ 0
cur =: 4 : 0
	echo x,y
	if. (x >: y) +. (*. / tens x,y)
	do.
		0.
		return.
	end.
	
	m =. x (meet &: digits) y

	if. 1 ~: $m
	do.
		0.
		return.
	end.
	m =. 0 { m
	md =. m&dd

	echo m;x;y
	r1 =. x ((md @: [ ) % (md@:])) y
	if. r1 = x % y
	do. 
		result =: result, x;y
	end.
	0
)

cur"0 0 0 /~ 10 + i.90

echo result
