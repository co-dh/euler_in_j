face =: 1 2 5 10 20 50 100 200

subset_encoded =:  +/ @: ( ([ , 0:) (="0 0 1) ] )

echo #.  200 subset_encoded face
NB. echo 100 200 subset_encoded face
nway =: 4 : 0
	if. y = 0
	do.
		1
		return.
	end.
	if. 0 = $x
	do. 0
		return.
	end.
	less =. (x <: y) # x
	without_last =. (}: less) nway y
	with_last =. less nway y - _1 { less
	without_last + with_last
)

NB. #echo face nway 200
