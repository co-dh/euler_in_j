digits =: ($&10 @: >: @: <. @: (10&^.) #: ])"0
end =: 186000

cham =: 3 : 0
	r =: 0 $ 0
	for_i. 1 + i.y
	do.
		r =: r, digits i
		
	end.
	r
)


ch =:  cham end

