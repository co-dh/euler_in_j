def perm():
	for i in range(0,10):
		for j in range(i+1,10):
			for k in range(j+1, 10):
					for l in range(k+1, 10):
						for m in range(l+1, 10):
							for n in range(m+1, 10):
								yield [i,j,k,l,m,n]

from pprint import pprint as pp

def add9(lst):
	if 6 in lst and 9 not in lst:
		return tuple(lst + [9])
	elif 9 in lst and 6 not in lst:
		return tuple(lst + [6])	
	else:
		return tuple(lst)	


def can(n, a, b):
	if n[0] in a and n[1] in b:
		return True
	if n[0] in b and n[1] in a:
		return True
	return False

sqs = [[0,1], [0,4],[0,9],[1,6],[2,5],[3,6],[4,9],[6,4],[8,1]]
def disp_square(a,b):
	def can1(n):
		return can(n,a,b)
	return all ( map(can1, sqs)) 
a = [0,5,6,7,8,9]
b = [1,2,3,4,8,9]
assert disp_square(a,b)
b1 = [1,2,3,4,6,7,9]
assert disp_square(a,b1)

def tot():
	ns = map(add9, perm())
	return [tuple(sorted((a,b)))	for a in ns	for b in ns
			if disp_square(a,b) ]
print tot()[:10]			
print len(set(tot()))
print len(tot())

# 97 large non-Mersenne prime
(28433 * (2^7830457) + 1) % (10 ^10)
