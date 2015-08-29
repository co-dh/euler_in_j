
def npart(parts, s, pred = lambda x : True):
	"""
	[int] -> int -> func -> [[int]]
	partitions of int s by parts. filter by pred"""
	#print s, parts
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

from copy import copy
def dec(array, idx):
	c = copy(array)
	c[idx] -= 1
	return c

def mult_perm(cnts1_elements):
	""" ([int],[e]) -> [[e]]
	multiset permutation""" 
	cnts1, elements = cnts1_elements
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

from operator import add
def repeat(cnts, elements):
	"""[Int] -> [a] -> [a] with len(cnts) == len(elements)
	return c copy of each element .
	Or convert a multiset to list
	"""
	return reduce(add, [ [n] * c  for n ,c in zip(elements, cnts) ], [])

def swap(x):
	"swap a tuple's elements"
	assert len(x) == 2 and type(x) == tuple
	return x[1], x[0]

from collections import defaultdict
def list_to_multiset(lst):
	""" [a] -> [Int] -> [a]
	given a list,return the count of each distinct element, and the distinct elements list"""
	d = defaultdict(lambda : 0)
	for x in lst:
		d[x] += 1
	return swap( unzip(d.items()))

def unzip(xys):
	"[(x,y)] -> ([x], [y])"
	return [x[0] for x in xys], [x[1] for x in xys]

def list_to_int(x):
	return int(''.join(map(str,x)))

from stream import Stream

def sq_part(n):
	""" int -> [int]
	return numbers whose digit square sum is n"""
	if n > 	567: # 567 is 7 * 9*9, the max of digit sum of a 7 digits number, 9999999
		return []
	nums = [9,8,7,6,5,4,3,2,1]
	squares = [81,64,49,36,25,16,9,4]
	f = lambda x : sum(x) < 8
	return Stream(npart(squares, n,f)).repeat(nums).perm1.reduce(add, [])

""" 
[4,4,4,4,4,3] 
	{list_to_multiset }
[1,5],[3,4] # cnt, elements
	{mult_perm}
[[3,4,4,4,4,4],[4,3,4,4,4,4] ...]
	{}
"""

def perm1(ns):
	"""[int] -> [int]
	all permuation of a number .
	[4,4,4,4,4,3] -> [344444, 434444, ...]
	"""
	return Stream(mult_perm( add0(list_to_multiset(ns))) ).list_to_int.list_
 
def add0(cnts_elements):
	""" ([int], [int]) -> ([int], [int]) 
	add 0 to a multiset so total number of elements is 7
	e.g. ([3,2],[1,2]) -> ([2,3,2],[0,1,2])
	"""
	cnts, elements = cnts_elements
	n = 7 - sum(cnts)
	if n > 0:
		return [n] + cnts, [0] + elements
	else:
		return cnts_elements

#print sq_part(89).filter(lambda x : x <= 567).list_

from collections import deque
def bread_first_search(root, child_func):
	q = deque()
	q.append(root)
	while q:
		node = q.popleft()
		yield node
		q.extend(child_func(node))

def child(n):
	"temporarily disable number larger than 567 for debugging"
	return sq_part(n).filter(lambda x : x <= 567).list_

#import cProfile
#cProfile.run("print Stream(bread_first_search(89, child)).take_(5)", 'mset_profile')
#print Stream(bread_first_search(1, child)).take_(10)


print child(203)