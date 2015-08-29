from multiset import *

def test_repeat():
	assert [] ==  repeat([],[])
	assert [1,1] == repeat([2],[1])
	assert [1,3,3] == repeat([1,0,2], [1,2,3])

def disp1(x):
	return ''.join(map(str,x))

def disp2(x):
	return ','.join(map(disp1, x))

def test_mult_perm():
	ns = [1,2,3]
	assert [[]] == list(mult_perm( ([], ns)))
	assert [[1]] == list(mult_perm( ([1], ns ) ))
	assert [[1,1]] == list(mult_perm(([2],ns) ))
	assert [[1,1,2],[1,2,1],[2,1,1]] == list(mult_perm( ([2,1], ns) ))

	vv = mult_perm( ([3,2,],'123') )
	assert '11122,11212,11221,12112,12121,12211,21112,21121,21211,22111' ==  disp2(vv)	
	assert 1260 == len(list(mult_perm( ([2,1,2,1,1],'54321') )))

def test_npart():
	assert 73682 == len(list(npart([200,100,50,20,10,5,2], 200)))

def test_list_to_multiset():
	assert ([],[]) == list_to_multiset([])
	assert ([1],[1]) == list_to_multiset([1])
	assert ([2],[1]) == list_to_multiset([1,1])
	assert ([2,3,1], [1,2,3]) == list_to_multiset([1,1,2,2,2,3])

def test_perm1():
	assert [344444, 434444, 443444, 444344, 444434, 444443] == perm1([4,4,4,4,4,3])

def test_add0():
	assert ([7], [0]) == add0( ([],[]))
	assert ([2,3,2], [0,1,2]) == add0(([3,2],[1,2]))	