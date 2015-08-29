def part(n, m):
	"ascending partition of n with minimum m"
	#print n,m
	if n == 0:
		yield []
	elif m == n:
		yield [m]
	else:	
		for h in range(m, n+1):
			n1 = n-h
			m1 = h
			if n1 == 0 or n1 == m1 or m1 <= n1:
				for res in part1(n-h, h):
					#print 'h:', h,'res:',res , 'n:', n
					#r.append( [h] + res )
					yield [h] + res

	#return r		
def part1(n,m):
	return list(part(n,m))
assert [[1]] == part1(1, 1)
assert [] == part1(1,2)
assert [] == part1(1, 2)
assert [[2]] == part1(2, 2)

#print part1(6, 1)
#for x in part(40,1):
#	print x



def pp(x):
	print x
print len(list(part(45, pp)))

