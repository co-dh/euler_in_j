root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

NB. 1 1 -> 0. x : [x1,y1] , y : [x2, y2]
x =. 1 1
y =. 2 0

right =: 4 : 0
	[a =. +/ *: x
	[b =. +/ *: y
	[c =. +/ *: x - y
	[s =. /:~ a,b,c
	((+/@:}:) = {: ) s
)

cnt =: 3 : 0
	cc =. 0
	for_x1. i.y do.
		echo 'x1';x1
		for_x2. x1 range y do.
			for_y1. i.y do.
				for_y2. i.y do.
					if. (x1 = x2) *. (y1 >: y2) do.	continue. end.
					if. (x1 = 0) *. (y1 = 0) do.	continue. end.
					if. (x2 = 0) *. (y2 = 0) do.	continue. end.
					if. (x1 = 0) *. (x2 = 0) do.	continue. end.
					if. (y1 = 0) *. (y2 = 0) do.	continue. end.

					if. (x1 = x2) *. (y1 = 0) do.
						NB.echo (x1,y1);x2,y2
						cc =. >: cc
					elseif. (y1 = y2) *. (x1 = 0) do.
						NB.echo (x1,y1);x2,y2
						cc =. >: cc
					elseif. (x1 = 0) *. (y2 = 0) *. (y1 ~: 0) *. (x2 ~: 0) do.
						NB.echo (x1,y1);x2,y2
						cc =. >: cc
					elseif. 1 do.
						if. (x1, y1) right (x2,y2) do.
							NB.echo 'todo: ';(x1,y1);x2,y2
							cc =. >: cc
						end. 								
					end.
				end.
			end.
		end.
	end.
	cc
)

echo cnt 51
