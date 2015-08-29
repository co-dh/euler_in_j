
# subset of multiple set.
def loops(*a):
	if a == ():
		yield []
		return 
	for i in range(a[0]):
		for t in loops(*a[1:]):
			yield [i] + t

import sys
 
def is_prime(n):
    return zip((True, False), decompose(n))[-1][0]
 
class IsPrimeCached(dict):
    def __missing__(self, n):
        r = is_prime(n)
        self[n] = r
        return r
 
is_prime_cached = IsPrimeCached()
 
def primes():
    yield 2
    n = 3
    while n < sys.maxint - 2:
        yield n
        n += 2
        while n < sys.maxint - 2 and not is_prime_cached[n]:
            n += 2
 
def decompose(n):
    for p in primes():
        if p*p > n: break
        while n % p == 0:
            yield p
            n /=p
    if n > 1:
        yield n


from itertools import groupby
a= list(decompose(540) )       
assert a == [2,2,3,3,3,5]

def prime_powers(dec):
	return [(k, len(list(g)))  for k, g in groupby(dec)]

def unzip(tuples):
	return [x[0] for x in tuples], [x[1] for x in tuples]

assert ([2,3,5], [2,3,1]) ==  unzip(prime_powers(a))
		 
from operator import mul
def prod(n):
	return reduce(mul, n , 1)

def pows(primes, powers):
	return map( (lambda (x,y) : x ** y), zip(primes, powers))

assert 108 ==  prod(pows([2,3], [2,3]))

