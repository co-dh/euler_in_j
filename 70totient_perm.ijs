root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'


ps =: ((is_perm totient) # ])  2 +i.10000000
min =. (i. (<. /)) (% totient) ps
min 
1768 { ps
totient 8319823

