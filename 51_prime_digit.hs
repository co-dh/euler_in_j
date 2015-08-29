import Data.Array
--replace a new = mapM (\idx -> writeArray a idx new) 

type AII = Array Int Int
replace :: AII -> [Int] -> Int -> AII
replace a idxs new = a // zip idxs (repeat new)

listToArray :: [a] -> Array Int a
listToArray l = listArray (0, length l -1) l

replaces :: [Int] -> [Int] -> [Int]
replaces n idxs = n |> listToArray 
					|> (\a -> map (replace a idxs) [0..9]) 
					|. elems 
					|> filter (\x -> head x /= 0) 
					|. undigits

primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = not $ any (`divide` x) lst
	where 
		n 		= floor  $ sqrt $ fromIntegral x
		lst 	= takeWhile (<= n) primes

divide :: Int -> Int -> Bool
divide x y = 0 == (y `mod` x)

digits :: Int -> [Int]
digits x | x < 10    = [x]
         | otherwise = digits d ++ [m]
            where (d,m) = divMod x 10

undigits :: [Int] -> Int
undigits = foldl (\a b -> a*10 + b) 0

x |. f = map f x
x |> f = f x

main :: IO ()
main =	do
	let a = 56003
	print $ show $ digits a
--sequence [ [ 1], [1..9]] |. ( \[idx,new] -> replace d idx new) |. undigits |> filter isPrime  |> nub

--select s number from total t numbers, start from start.
select :: Int -> Int -> Int -> [[Int]]
select _ 0 _     = [[]]
select t s start = concatMap f firsts
	where 
		firsts = [start .. t-s]
		f first = map (first : ) $ select t (s-1) (first+1)

nPrimes1:: [Int] -> [Int] -> Int
nPrimes1 n idxs = replaces n idxs |> filter isPrime |> length  


nPrimes2 :: [Int] -> Int -> Int
nPrimes2 n nReplace = select (length n) nReplace 0 |. nPrimes1 n |> foldl max 0

nPrimes :: Int -> Int
nPrimes n = [1 .. length ds - 1] |. nPrimes2 ds |> foldl max 0
	where ds = digits n
--primes |> filter (\x -> nPrimes x == 7) |> take 1