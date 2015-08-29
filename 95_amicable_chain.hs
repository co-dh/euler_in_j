import Data.List
import Data.Array

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = not $ any (`divide` x) lst
	where 
		n 		= floor  $ sqrt  (fromIntegral x  :: Double)
		lst 	= takeWhile (<= n) primes

-- decompose a number to a list of prime numbers
decompose :: Int -> [Int]
decompose n | n == 1 	 = []
		    | otherwise  = f : decompose (n `div` f)
	where
		f = primes |> filter (`divide` n) |> head
-- give a list of int with duplications, return uniq elements with count		
primesPowers :: [Int] -> ([Int], [Int])
primesPowers xs = (uniqs , counts)
	where
		uniqs = nub xs
		counts = map count uniqs
		count n = filter (== n) xs |> length

divide :: Int -> Int -> Bool
divide x y = 0 == (y `mod` x)

pow :: Int -> Int -> Int
pow _ 0 = 1
pow x y = x * pow x (y - 1)

(|.) :: [a] -> (a->b) -> [b]
x |. f = map f x

(|>) :: a -> (a->b) -> b
x |> f = f x

divisors :: Int -> [Int]
divisors n = powers |. (\x->[0..x]) |> sequence |.  zipWith pow primes  |. product
	where 
		(primes, powers) = n |> decompose |> primesPowers

propDivisors :: Int -> [Int]
propDivisors n = divisors n |>  filter (/= n) 

amicable :: Int -> Int
amicable 0 = 0
amicable n = sum $ propDivisors n

limit = 100000
ams :: Array Int Int
ams = array (0,limit) [(i, amicable i) | i <- [0..limit]]

chainLength = length . amChain
ls = map chainLength $ elems ams
ma = maximum ls

takeAfter :: Int -> [Int] -> [Int]
takeAfter x n'@(n:ns) | x == n    = n'
					  | otherwise = takeAfter x ns
					  
amChain :: Int -> [Int]
amChain n = ac [n]
	where 
		ac :: [Int] -> [Int]
		ac [] = []
		ac ns | next `elem` ns = takeAfter next ns
			  | next > limit = []
			  | next == 0 	   = []
			  | otherwise      = ac(ns ++ [next] )
			where
				next | last ns > limit  = 0 
				     | otherwise 		  =  ams ! last ns
{- 
bigger :: (Int, Int) -> (Int, Int) -> Ordering
bigger (_, x) (_, y) = compare x y
-}


main :: IO ()
main =	
	ma |> show |> print
