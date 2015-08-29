def square(x):
	return x * x

def next(n):
	return sum(map(square,map(int,str(n))))

def end(n):
	if n in [1,89]:
		return n
	else:
		return end(next(n))

assert 32 == next(44)	
assert 13 == next(32)
assert 1 == end(44)
assert 89 == end(85)
#r = [0] * (10000000+1)
#r[1] = 1
#r[89] = 89

def ends(n):
	while n not in [1,89]:
		yield n
		n = next(n)
	yield n

#print list(ends(2))		
def foo():
	set1 = {1}
	set2 = {89}

	for i in range(1, 10000000+1):
		if 0 == i % 10000:
			print i
		if i not in set1 and i not in set2:
			ns = list(ends(i))
			if ns[-1] == 1:
				set1 |= set(ns)
			elif ns[-1] == 89:
				set2 |= set(ns)
			else:
				assert False, i
	return len(set2)			
#print foo()
#print list(ends(3))
def rev(n):
	for x in range(0,10):
		for y in range(x,10):
			if x*x + y * y == n:
				yield x,y

print list(rev(89))				
print list(rev(58))				
print list(rev(85))				

def f(x):
	return list(rev(x))
	
