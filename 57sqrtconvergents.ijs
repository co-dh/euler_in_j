root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

s =:  1 2r1 
m =: 2 2 $ 0 1 1 2

f =: dot & m

+/ >/"1 (#@digits)"0 de_rational 1 + %/"1 f^:(i.1000) s 


