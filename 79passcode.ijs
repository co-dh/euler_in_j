root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'


[data =. read <root,'keylog.txt'
data =.  ~. split data
data =.  > data

[c12 =. sort @ ~. @ , @ (1 2 & ({"1))

[all =. sort ~.,data NB. 4 is not in the numbers

NB. loop below 3 lines, the first are the numbers in order
[first =. all -. c12 data
[data =. (replace &(first;''))"1 data
[all =. all -. first

