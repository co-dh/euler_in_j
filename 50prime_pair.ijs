root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

xcy =: ". @: ((": @ [ )  , (": @]))
ycx =: ". @: ((": @ ] )  , (": @[))

pp =: (*./ @: is_prime @: (xcy , ycx))("0)
rel =. +./ . *.
echo 'start p'
p =: pp/~ primes =: p: 1+ i.2000
echo 'end p'
range =: 4 : 0
	if. x > y do. '' return. end.
	x + i.(y-x)
)

brute =: 3 : 0
 	len =. # y
 	for_i. i.len do.
 	echo i
 		for_j. (1+i) range len do. 
 			if. not (<i,j) { y do. continue. end. 
	 		for_k. (1+j) range len do. 
	 			if. not (<i,k) { y do. continue. end. 
	 			if. not (<j,k) { y do. continue. end.
	 			for_l. (1+k) range len do.
		 			if. not (<l,i) { y do. continue. end. 
		 			if. not (<l,j) { y do. continue. end. 
		 			if. not (<l,k) { y do. continue. end. 
		 			for_m. (1+l) range len do.
			 			if. not (<m,i) { y do. continue. end. 
			 			if. not (<m,j) { y do. continue. end. 
			 			if. not (<m,k) { y do. continue. end. 
			 			if. not (<m,l) { y do. continue. end. 
			 			echo (i,j,k,l,m) { primes
			 			return.
					end.		 			
	 			end.  	 			
	 		end.
 		end.
 	end.
 )
NB. brute p

+/ 13 5197 5701 6733 8389

