root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

w =: 11

fill =: 3 : 0
	tab =: (,~y+1) $ 0
	col1 =: <"1 (1 + i.y) ,.1
	row0 =: <"1 [ 0,.i.y+1 
	row1 =: <"1 [ 1,.i.y+1 
	tab =: 1 col1 } tab
	tab =: 1 row0 } tab
	tab =: 1 row1 } tab
	for_s. 2 range 1+y do. NB. s is the sum of numbers
		for_m. 2 range 1 + s do. NB. m is the max of numbers
			NB. t[s,m] = t[s-m, m-1] + t[s-2m, m-1] + ... t[s, m-1]
			t =. 0
			s1 =. s
			while. 0 <: s1 - m do.
				s2 =. s1 - m 
				m2 =. s2 <. m -1
				a =. (<s2,m2) { tab
				assert a NB. a must not be 0, otherwise we are out of range.
				t =. t + a
				s1 =. s2
			end.
			NB. now the case for no m
			a =. (<s, s<.m-1) { tab
			assert a NB. a must not be 0, otherwise we are out of range.
			t =. t + a
			tab =. t (<s,m) } tab
		end.
	end.
	tab
)

t =: fill 100
(<100, 99) {t
(<5,4) { t
