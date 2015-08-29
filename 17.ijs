root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

w0 =: '';'one';'two';'three';'four';'five';'six';'seven';'eight';'nine'
w1 =: 'eleven'; 'twelve';'thirteen';'fourteen';'fifteen';'sixteen';'seventeen';'eighteen';'nineteen'

w2 =:'';'ten';'twenty';'thirty';'forty';'fifty';'sixty';'seventy';'eighty';'ninety'

cnt =:  +/ @: (( $ @: >)each )
c0 =: cnt w0 

cnt w0,w1

to_word =: 3 : 0
	ds =. digits y
	if.  3 = $ds do.
		t =. 0 { ds
		if. 0 = 100 | y do.
			<(>t { w0),'hundred'		
		else.
			<(>t { w0) ,'hundredand', > to_word  undigits dehead ds
		end.
	elseif. y < 20 do.
		y { w0,(<'ten'),w1,<'twenty'
	elseif. 1 do.
		tens =. 0 { ds
		ones =. 1 { ds
		<(>tens { w2),>ones{w0		
	end.
)
($'onethousand') + cnt to_word each 1 + i.999
