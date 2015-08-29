root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'
is_circle =: (*./ @: (1&p:)@: undigits @: all_rotation @: digits)"0
NB.35 $(is_circle # ]) 2 + i.1000000-2

NB.36
pal2 =: ((pal @: #:)  *. (pal @: digits))"0
NB. echo +/(pal2  # ]) 1 + i.1000000
tprim =: (*./ @: (1&p:) @:  (undigits\. , undigits\)@:digits )"0
NB.37 echo (tprim # ])11 + i.1000000

NB. 38 ( 1, 2) * [5000 - 9999], 1 2 3 * [100 333] , 1 2 3 4 * (10 33)
pan =: (,@:digits @:(* (>: @: i.)))
is_pan0 =: 0&{ @: (9&=) @: $ @: ~. 

p3 =: pan & 3
pan3 =: (is_pan0 @: p3)"0
p5 =: pan & 5
pan5 =: (is_pan0 @: p5)"0
echo  p5 9

pan3s =: undigits p3"0 (pan3 # ]) 100 + i.233

NB. echo pan3s
