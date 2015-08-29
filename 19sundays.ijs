root =: '/home/hdeng/jscripts/'
load root,'pylib.ijs'

is_leap =: 3 : 0
	(0 = 400 | y ) or (not 0 = 100 | y) and 0 = 4 | y
)
NB.is_leap each 1900 1984 2000 1983

NB. return the number of days of y year x month

days =: 4 : 0
	if. y e. 1 3 5 7 8 10 12 do.
		31
	elseif. y = 2 do.
		28 + is_leap x
	elseif. 1 do.
		30		
	end.
)

days_of_year =: 365 & + @: is_leap 
NB. days_of_year 2000 1984 1983

days_to =: +/ @:  days_of_year  @: ((1900&+) each) @: i. @: (-&1900) 

NB. the weekday of Jan 1 of year  y.
weekday11 =: 1 + 7 | days_to 

NB. return the week day of year 0{y, month 1{y, day 2{y
weekday =: 3 : 0
	'y1 m d' =. y
	w =. weekday11 y1
	7 | w + (d - 1) +  +/ y1 days each 1 + i.m -1
)
NB. weekday 2013 10 6

weekday1 =: weekday @: (,&1)@: , 

+/, 0 = (1901 + i.100) weekday1 each / 1 + i.12

