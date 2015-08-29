ndigit =: >. @: (10& ^.)
digits =: ($&10) @: ndigit #: ]
p5 =: (+/ @: (^&5) @: digits)  
is_p5 =: = p5  


top =: 354294
find_all =: 3 : 0
	r =. 0 $ 0
	for_i. (1 + i.y) 
	do.	    
		if. is_p5 i
		do.	
			r =. r,i	
		end.

	end.	
	r
)

echo +/find_all 354294
