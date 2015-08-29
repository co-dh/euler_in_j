NB. 1 0-> 0, count number of occurance of x in y
count =:  (+/@:=)"_ 1 0
nsols =: 3 : ' >.  -:  */ >: +: (count ~.) 3 p: y ' 

(; nsols)"0 [ 2 + i.10
 

brute =: 3 : 0
	i =. 2
	while. 1000 > nsols i  do.
		if. 0 = 100 | i do.
			echo i; nsols i
		end.
		i =. i + 1
	end.
	echo i; nsols i
	i
)

brute 0

