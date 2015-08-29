from sympy import *

x, y, z, m, n, d = symbols('x y z m n d', integer = True)
def pan(x):
	return x * ( 3*x - 1) / 2
#print simplify(solve(pan(n) - x, n)[1])
print simplify (pan(n+d) - pan(n))

