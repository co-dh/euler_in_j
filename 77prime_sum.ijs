root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

fill =: 3 : 0
	[cols =. 1 + nprimes_lt y
	[rows =. 1 + y
	[tab =: (rows, cols) $ 0

	[row0 =: <"1 [ 0,.i.cols
	[tab =: 1 row0 } tab NB. row 0 is 0, because if sum is 0, then it can be divided

	[ps =. 0, p: i.cols -1	NB. 0,primes
	NB. row1 is 0, because there is no way to sum primes to 1	

	for_s. 2 range rows do. NB. s is the sum of numbers
		for_c. 1 range cols do. NB. m is the max of numbers
			m =. c { ps
			if. m <: s do. 
				m1 =. (c-1){ps NB. smaller prime
				NB. t[s,m] = t[s-m, m1] + t[s-2m, m1] + ... t[s, m1]
				t =. 0
				s1 =. s - m
				while. 0 <: s1 do.
					a =. (<s1,c-1) { tab 
					t =. t + a
					s1 =. s1 - m
				end.
				NB. now the case for no m
				a =. (<s, c-1) { tab
				t =. t + a
				if. t > 5000 do. 
					echo s;c
				end.
				tab =. t (<s,c) } tab
			else. NB. fill the rest of the row
				[smaller_prime =. _4 p: 1 + s
				[idx =. ps i. smaller_prime
				[val =. (<s, idx) { tab
				[rest =. <"1 s ,. 1 + idx range cols - 1
				[tab =. val (rest) } tab
				NB. max prime > sum. take the value from [sum, prime < sum] 
				continue. NB. skip c loop
			end.
		end.
		NB. fill remain part of row s with tab[s][
	end.
	tab
)

echo >./,fill 71
