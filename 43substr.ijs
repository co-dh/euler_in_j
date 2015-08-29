digits =: ($&10 @: >: @: <. @: (10&^.) #: ])"0

tenx =: ($&10) @: $
undigits =: (#.~ tenx)

y =: 1406357289
y1 =: digits y
tri =: (<: , ] ,  >:)"0
primes =: 2 3 5 7 11 13 17
range =: 2 + i.7
tr =: tri range
row =: tr & { "1
filter =: (*./) @: (0&=) @:  (primes& |) @:   undigits @  row 
NB. echo filter y

perms =: (i. & !) A. i.
a =: perms 10
echo +/ undigits  (filter # ] ) a

