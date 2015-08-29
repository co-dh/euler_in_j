import math

def isPalin(x):
	rev = 0
	x1  = x
	while x1 > 0:
		rev = rev * 10 + x1 % 10
		x1 /= 10
	return rev == x


def findAll(limit):
	pals = set()
	def test(x):
		if isPalin(x):
			pals.add(x)
	l2 = int(math.sqrt(limit))+1
	for s in range(1, l2):
		ss = s * s
		#test(ss)
		for e in range(s+1, l2):
			ss += e * e
			if ss > limit:
				break
			test(ss)
	return pals
			
s = findAll(1e8)
print s
print len(s)
print sum(s)
