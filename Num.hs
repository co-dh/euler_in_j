module Num (enumerate, digits, undigits, primes, isPrime) 
where

enumerate :: [a] -> [(Int, a)]
enumerate = zip [0,1..]

digits :: Int -> [Int]
digits x | x < 10    = [x]
         | otherwise = digits d ++ [m]
            where (d,m) = divMod x 10

undigits :: [Int] -> Int
undigits = foldl (\a b -> a*10 + b) 0

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = not $ any (`divide` x) lst
	where 
		n 		= floor  $ sqrt $ fromIntegral x
		lst 	= takeWhile (<= n) primes

divide :: Int -> Int -> Bool
divide x y = 0 == (y `mod` x)
