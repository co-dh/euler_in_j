root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

x =: 7
y =: 30

rem =: 4 : 0
	(*: x) | x: (+/((<: , >:)x: x) ^ x: y	) 
)

7 rem 30

7 rem 4
>. / (13&rem)"0 >: i.100  

6 ^ 3
8 ^ 3
