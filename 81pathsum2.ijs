root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

[#data =: read <root, 'matrix.txt'
rows =. split data
$rows
NB. M =: (((".@>) each) @ split @ (,&',') @ >)"1  rows
NB. width =: 80
M =: 5 5 $ 131	673	234	103	18   201 96	342	965	150  630 803 746 422 111  537 699 497 121 956  805	732	524	37	331
width =: 5

path_sum2 =: 4 : 0 M.
	echo x,y
	if. (x = <: width)  *. (y = <: width) do.
		(<x,y) { M
	elseif. (x >:  width) +. (y >:  width) do.
		1e9
	elseif.	1 do.
		r =. ((<x,y) { M ) + ((>: x) path_sum  y) <. (x path_sum >: y)
		echo x,y,r
		r
	end.
) 


