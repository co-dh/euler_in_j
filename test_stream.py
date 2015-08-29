from stream import Stream, narg, builtin_args
def square(x):
    return x * x

#print Stream(xrange(15)).each(square).take(10)         
from itertools import *
#print (imap(square, xrange(10)))

def test_unary():
    assert [0,1,4,9,16] == Stream(xrange(100)).square.take_(5)

def gen():
    yield 'hello'
    yield 'world1'  

def add(x,y):
    return x + y 

def test_binary_function():
    assert [10,11] == Stream(gen()).len.add(5).list_


def test_empty():
    assert [] == Stream(xrange(0)).list_

def test_builtin_args():
    for f in __builtins__.values():  
        doc = (getattr(f,'__doc__', '\n') or '\n').split('\n')[0]    
        print builtin_args(f), '|', doc
