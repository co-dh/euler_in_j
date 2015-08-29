from collections import deque

from copy import copy
def next(nums):
	"""[Int] -> [[Int]]"""
	r = []
	if len(nums):
		c = copy(nums)
		c[0] += 1
		r.append(c)

	for i in range(len(nums) - 1):
		if nums[i] > nums[i+1] :
			c = copy(nums)
			c[i+1] += 1
			r.append(c)
	r.append(nums + [1])		
	return r
	
assert [[5,3],[4,4], [4,3,1]] == next([4,3])			
assert next([]) == [[1]]

from operator import add
def next2(numss):
	return reduce(add, map(next, numss))

assert next2([[]]) == [[1]]

def part(n):
	x = [[]]
	for i in range(n):
		x = next2(x)
	return sorted(list(set(map(tuple,x))), reverse = True)
	
#print part(1)
#print part(2)
from pprint import pprint
#pprint (part(5))

#pprint( part(9, 4))

def add1(k, p):
	assert len(p) <= k
	a = [1] * k
	for i in range(len(p)):
		a[i] += p[i]
	return a

def partresc(n):
	a = [0] * (n+1)
	def recasc(n,m, k):
		assert 1 <= m <= n
		for x in range(m, int(n/2)+1):
			a[k] = x
			for foo in recasc(n-x, x, k+1):
				yield foo
		a[k] = n
		yield (a[1 : k+1])

	return  recasc(n,1,1)

def part(n):
	assert n > 0
	k = 2
	a = [0] * (n+3)
	a[2] = n
	while k!= 1 :
		y = a[k] - 1
		k -= 1
		x = a[k] + 1
		while x <= y :
			a[k] = x
			y -= x
			k += 1
		a[k] = x + y
		yield a[1 : k+1]	

#print list(part(9))

from  operator import mul
def prod(nums):
	return reduce(mul, nums)

def prod_sum(k):
	""" return smallest N 
	where { N = sum A = prod A, Ai in N, len(A) = k} """ 
	print k
	n = 1
	while True:
		print k,n
		for p in part(n):
			if len(p) <=k and prod(add1(k,p)) == n+k:
				return n + k
		n += 1
	assert False	

def test():
	for k in range(2,30):
		print k, prod_sum(k)

#print sum(set(map(prod_sum, range(2,12001))))

print prod_sum(114)
#test()
#prod_sum(2)
#print list(part(5))

#prod_sum(5)
#print part(5,5)


