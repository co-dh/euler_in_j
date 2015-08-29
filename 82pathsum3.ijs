root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

[#data =: read <root, 'matrix.txt'
rows =. split data
M =: (((".@>) each) @ split @ (,&',') @ >)"1  rows
NB. width =: 80

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
NB. width =: 5

path_sum =: 3 : 0
	M =. y
	[width =. 0 { $ M
	NB. copy M last column to R's last column
	R =. (width , width-1) $ 0
	[R =. R,. last_col =: (_1 &{)"1 M
	[ queue =. build_heap last_col ,. (i.width) ,. <: width NB. priority queue
	
	while. (#queue) > 1 do. NB. current column being processed
		NB. if head's left is cur_col and empty
		'min row col' =. head =.  1 { queue
		[left_col =. <: col 
		[left =. <row, left_col
		
		if. left_col >: 0 do.
			if. 0 = left { R do. 
				NB. left element is determined.
				[new_val =. min + left { M  
				if. left_col = 0 do. return. end.

				[R =. new_val (left) } R
				[queue =. (new_val, row, left_col) enter_heap queue
			end.	
		end.			
			NB. check up 
		[up =. <(row-1), col
		if. ((row - 1) >: 0) do. 
			if. 0 = up { R do.
				[new_val =. min + up { M  
				[R =. new_val (up) } R
				[queue =. (new_val, (row-1), col) enter_heap queue
			end.	
		end.	
		NB. check down	
		[down =. <(row+1), col
		if. (row + 1) < width do. 
			if. 0 = down { R do.
				[new_val =. min + down { M  
				[R =. new_val (down) } R
				[queue =. (new_val, (row+1), col) enter_heap queue
			end.	
		end.	
		[queue =. remove_heap queue	
	end.
	R
)

echo path_sum M










