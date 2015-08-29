root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

data =:detail fread root,'cipher1.txt'
data1 =:". > split data,','

decrypt =: 4 : 0
	NB. int[] X int[] -> string. decrypt y with x.
	(XOR / y ,: ($y) $ x) { a.
)

try_all =: 3 : 0
	lower =. 97 + i.26
	for_i. lower do.
		for_j. lower do.
			for_k. lower do.
				de =. (i,j,k) decrypt data1
				if.  ' the ' in de do.
					de
					return.
				end.
			end.
		end.
	end.
)
de =: try_all 0
+/a. i. de


