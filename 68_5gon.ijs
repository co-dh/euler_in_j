root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

sel3 =: (3 3 $ 3 2 1 5 1 0 4 0 2)
filter3 =: 3 : '*./ 0 = (- 0&{)+/"1 sel3 { y'

NB. find the row whose first element is smallest, rotate the rows to make that row first
rotate =. ( ([ i. <./) @:(0&{"1) |. ])"2  
~. sort ,"2 rotate sel {"0 2 1 (filter"1 # ]) 1 + perms 6

sel =: (5 3 $ 5 0 1  6 1 2  7 2 3  8 3 4  9 4 0)
filter =: 3 : '*./ 0 = (- 0&{) +/"1 sel {  y'
filtered =. (filter"1 #]) 1 + perms 10
can =. ~. sort ,"2 rotate sel {"0 2 1 filtered

rm_space =: ' '&~: # ]

((16&=@:# @: rm_space)"1 # ]) rm_space"1 ": can


(/:  ) 5 3 $  6  5  3 10  3 1 9 1  4 8  4 2  7 2  5
