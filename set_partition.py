

def sp(n):
	"int -> [ [int] ] "
	if n == 1:
		yield [1]
		return 
	else:
		for a in sp(n-1):
			for last in range(1, max(a)+2):
				yield a+[last]

print list(sp(4))				



