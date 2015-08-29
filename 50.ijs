root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

(last_index_of&1 )is_prime +/ \ p: i.547
is_prime +/p: i.536


(last_index_of&1 )is_prime +/ \ p: i.100
is_prime +/p: i.536

(last_index_of&1) is_prime  +/ \ p: i.25

is_prime +/  p: i.14

long =: 3 : 0
	1 + (last_index_of&1 )( is_prime and <&1e6) +/ \ p: y + i.(547 - y)
)

a =: +/ \ p: y + i.(547 - y)
is_prime 542 { a
