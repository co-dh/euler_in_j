g = { 
	7 : [8, 11],
	5 : [11],
	3 : [8, 10],
	11 : [2, 9, 10],
	8 : [9],
	2 : [],
	9 : [],
	10 : [],
}

from operator import add

def dfs(g):
	# find all node whose ndegree is 0
	not_in_degree0 = reduce(add, g.values())
	in_degree0 = set(g.keys()) - set(not_in_degree0)
	processing = {}
	def _dfs(g, root):
		if root not in processing:
			yield root
			processing[root] = True
			for next in g[root]:
				for x in _dfs(g, next):
					yield x
			processing[root] = False
					
	for root in in_degree0:
		for x in _dfs(g, root):
			yield x

#print list(dfs(g))

def top_sort(g):
	# find all node whose ndegree is 0
	not_in_degree0 = reduce(add, g.values())
	in_degree0 = set(g.keys()) - set(not_in_degree0)
	processing = {}
	def _dfs(g, root):
		if root not in processing:
			processing[root] = True
			for next in g[root]:
				for x in _dfs(g, next):
					yield x
			processing[root] = False		
			yield root

		elif processing[root]:
			raise Exception('not a DAG')	

	for root in in_degree0:
		for x in _dfs(g, root):
			yield x

#print list(reversed(list(top_sort(g))))
print list(top_sort(g))
