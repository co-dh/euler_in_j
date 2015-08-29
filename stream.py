import inspect
from functools import partial
builtin = {
    len : 1
}

def narg(f):
    if f in builtin:
        return builtin[f]

def builtin_args(f):
    "return how many number of arguments of a builtin"
    doc = (getattr(f,'__doc__', '\n') or '\n').split('\n')[0]
    idx1 = doc.find('(')
    idx2 = doc.find(')',idx1)
    if idx1 != -1 and idx2 != -1:
        if idx2 == idx1+1:
            return 0
        elif idx2 > idx1 + 1:
            args = doc[idx1+1:idx2]
            return args.count(',') + 1

def narg(f):
    if f  in __builtins__.values():
        return builtin_args(f)
    else:
        a = inspect.getargspec(f)
        return len(a[0])

class Stream:
    def __init__(self, it):
        self.it = it

    def take_(self, n):
        return [self.it.next() for i in range(n)]

    def __getattr__(self, ident):
        if ident in ['__getstate__', '__slots__' ]:
            raise AttributeError
        func = find_in_caller(ident)
        if func:
            if narg(func) == 1:
                return Stream(func(x) for x in self.it)
            else:
                return Stream( partial(func,x) for x in self.it)    
        raise AttributeError, "Stream has not attribute %s" % ident

    def __call__(self, *args, **kwargs):
        return Stream( f(*args, **kwargs) for f in self.it) 

    @property    
    def list_(self):
        return list(self.it)    

    @property   
    def show_(self):
        return str(list(self.it))   

    def __str__(self):  
        return str(list(self.it))   

    def reduce(self, binary_function, init):
        return Stream(reduce(binary_function, self.it, init).__iter__())    

    def filter(self, f):
        return Stream(x for x in self.it if f(x))    

def caller_env():
    frames = inspect.getouterframes( inspect.currentframe()) 
    for frame, file, line_no, func_name, code_context, index in frames:
        #print file, line_no,func_name, code_context, index
        if file.endswith('/stream.py'):
            continue
        return  frame.f_locals, frame.f_globals

def find_in_caller(ident):
    """ find ident in caller's locals() first, then globals()
    caller is the frame that just above current __file__
    """
    l, g = caller_env()
    
    f = l.get(ident, g.get( ident, None))
    if callable(f):
        return f 

    if f == None:
        # get ident from globals , if failed, from __builtins
        return getattr(globals(), ident, __builtins__[ident])
    
    



