root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

is_cube =: 3 : '0 = 1 | y ^ (1%3)'
NB. perms =: ((i. @: !@: #) A. ])
NB. digits =: #:~ (($&10)@: >: @: <. @: (10&^.))
NB. undigits =: (#.~ (($&10) @: $))
remove_short =: (   ((    #@:digits@:(0&{))=((#@digits)"0)) # ] )

display =: (1!:2) & 2

p3 =: 3 : '5 = # ~. ( is_cube # ] )remove_short undigits perms digits y'
find =: 3 : 0
	i =. 1x
	while. 1 do.
		display i
		i =. i + 1
		if. 0 = 10 | i do.
			continue.
		end.
		if. p3 i^3 do.
			i
			return.
		end.
	end.
)


norm =: 3 : 'undigits \:~ digits y'

(((4&|. = 3&|.) and (3&|. = 2&|.) and (2&|. = 1&|.) and  (1&|. = ]) ) # ])  /:~ norm each (1 + i.10000) ^ 3
NB. 987655433210 987665433210
   
(((=&987655433210) @: norm @:(^&3) )each # ] )(1 + i.10000)
5027 7061 7202 8288 8384
5027 ^3x
(((=&987665433210) @: norm @:(^&3) )each # ] )(1 + i.10000)
5196 8124 8496 9702 9783

(norm @:(^&3))each (1 + i.10)
