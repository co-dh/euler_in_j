
def npart(parts, s, pred = lambda x : True):
	if len(parts) == 0:
			if pred(s):
				yield  [s]
			else:
				yield []	
	else:
		for i,x in enumerate(range(s, -1, -parts[0])):
			for r in npart(parts[1:], x):
				r1 = [i] + r
				if pred(r1):
					yield r1

#print list(npart([5,2], 9))
assert 73682 == len(list(npart([200,100,50,20,10,5,2], 200)))

def take(n, gen):
	i = 0
	r = []
	for x in gen:
		if i >= n:
			return
		r.append(x)
	return r	

from operator import add
def repeat(numbers, cnts):
	return reduce(add, [ [n] * c  for n ,c in zip(numbers, cnts) ], [])

assert [] ==  repeat([],[])
assert [1,1] == repeat([1],[2])
assert [1,3,3] == repeat([1,2,3],[1,0,2])

def disp(x):
	return int(''.join(map(str,x)))

def sq_part(n):
	nums = [9,8,7,6,5,4,3,2,1]
	squares = [81,64,49,36,25,16,9,4]
	return map(disp,( map( (lambda x : repeat(nums, x)), 
			filter(lambda x: sum(x) <8,  npart(squares, n)))))

def test_sq_part():
	print sq_part(89)
	print len(sq_part(89))

from copy import copy
def dec(array, idx):
	c = copy(array)
	c[idx] -= 1
	return c

def mult_perm(elements, cnts1):
	"multiset permutation" 
	def p(cnts):
		"[int] -> [[e]]"
		if all(map((lambda x : x == 0), cnts)):
			yield []

		for i,c in enumerate(cnts):
			if c == 0:
				continue
			for r in p(dec(cnts, i)):	
				yield [elements[i]] + r
	return p(cnts1)

def disp1(x):
	return ''.join(map(str,x))

def disp2(x):
	return ','.join(map(disp1, x))

def test_mult_perm():
	ns = [1,2,3]
	assert [[]] == list(mult_perm(ns, []))
	assert [[1]] == list(mult_perm(ns, [1]))
	assert [[1,1]] == list(mult_perm(ns, [2]))
	assert [[1,1,2],[1,2,1],[2,1,1]] == list(mult_perm(ns, [2,1]))

	vv = mult_perm('123', [3,2,])
	assert '11122,11212,11221,12112,12121,12211,21112,21121,21211,22111' ==  disp2(vv)	
	assert 1260 == len(list(mult_perm('54321', [2,1,2,1,1])))


