def save(s):
	r = 0
	if 'LXXXX' in s :
		r += 3
	elif 'XXXX' in s:
		r += 2

	if 'DCCCC' in s :
		r += 3
	elif 'CCCC' in s:
		r += 2

	if 'VIIII' in s :
		r += 3
	elif 'IIII' in s:
		r += 2
	return r	


print sum([save(line) for line in file('roman.txt')])
	