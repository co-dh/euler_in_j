root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

(i.20) ^ 5
>. 10 ^. (i.200) ^ 5
n =: 30

num =: 3 : ' +/ y = ( # @: digits) each  (1 + i.200 ) ^ y'
+/ num each  1 + i. 30

