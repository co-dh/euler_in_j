root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

[#data =: read <root, 'matrix.txt'
rows =. split data
M =: (((".@>) each) @ split @ (,&',') @ >)"1  rows

NB. a heap.

NB. adjust y at position x
adjust_heap =: 4 : 0
	left =: +: 
	right =: >: @ +:

	i =. x
	[min =. 0 { i { y
	[dir =. _1
	[l  =. left  i
	[r  =. right i
	NB. find the smaller of left & right element
	if. l < #y do.
		le =. l { y
		if. (0 { le) < min do. 
			min =. le
			dir =. l
		end.
	end.
	if. r < #y do.
		re =. r { y
		if. (0 { re) < min do. 
			min =. re
			dir =. r
		end.
	end.
	if. dir ~: _1 do.
		NB. switch with dir
		y =. (i{y) (dir) } y
		y =. min (i) } y
		y =. dir adjust_heap y
	end.
	y
)

build_heap =: 3 : 0
	[y =. 0, y NB. index starts with 1, instead of 0, so append something at the begining
	[last =.<: 2^ <. 2^. <:  #y NB. last element in the last second row
	for_i. >: i. - last do.
		y =. i adjust_heap y
	end.
	y
)

enter_heap =: 4 : 0
	NB. enter element x into heap y
	NB. put new elemnts at the end of heap, and swap with parent while it's smaller then parent
	parent =: <. @ -: 
	[y =. y,x
	[selfx =. <: #y 
	self =. selfx { y
	[px =. parent selfx
	while. px > 0 do.
		[p =. px { y
		if. self < p do.
			NB. exchange self & parent
			[y =. self (px) } y
			[y =. p    (selfx) } y
			[selfx =. px
			[self =. selfx { y
			[px =. parent selfx
		else. break. end.
	end.
	y
)

NB. take the min element from, and replace it with a new element x
replace_heap =: 4 : 0
	y =. x (1) } y
	1 adjust_heap y
)

remove_heap =: 3 : 0
	NB. remove the minimum element from heap y.
	NB. move last element to head, remove last element, and adjust_heap
	if. (#y) = 2 do.
		0 { y
		return.
	elseif. (#y) = 1 do.	
		assert 0
	end.
	[y =. }: (_1 { y) 1 } y
	1 adjust_heap y
)


NB. [M =: 5 5 $ 131	673	234	103	18   201 96	342	965	150  630 803 746 422 111  537 699 497 121 956  805	732	524	37	331

path_sum =: 3 : 0
	M =. y
	[width =. 0 { $ M
	R =. (width , width) $ 0
	[R =. ((<0 0) { M ) (<0 0) } R
	
	[queue =. 2 3 $0 0 0 , ((<0 0) { M) ,  0 0 
	[dirs =. 4 2 $ 0 _1 0 1 _1 0 1 0
	cnt =. 0
	while. (#queue) > 1 do. NB. current column being processed
		cnt =. >: cnt
		NB. if head's left is cur_col and empty
		['min row col' =. head =.  1 { queue
		for_dir. dirs do.
			['r c' =. dir + row,col
			[p =. <r,c
			if. (0 <: r) *. (r < width) *. (0 <: c ) *. (c < width) do. 
				if. 0 = p { R do. 
					NB. left element is determined.
					[new_val =. min + p { M  
					[R =. new_val (p) } R
					[queue =. (new_val, r, c) enter_heap queue
				end.	
			end.			
		end.	
		[queue =. remove_heap queue	
		NB.echo 20 20 {. R
		NB.echo queue
	end.
	R
)

echo (<_1 _1) { path_sum M


2 2 {. i. 4 4
