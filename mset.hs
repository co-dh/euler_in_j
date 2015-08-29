import Data.List
import Control.Arrow
import Control.Exception
import qualified Data.Map as M
import qualified Data.Set as Set

loops :: [Int] -> [[Int]]
loops = sequence . map (\x -> [0..x])

filter_loops :: [Int] -> [Int] -> [[Int]]
filter_loops lmt xs = filter (lmt >= ) $ tail $ loops xs


-- cat xs to each head of ys
cat :: [Int] -> [[[Int]]] -> [[[Int]]]
cat xs ysss =  map (xs :) ysss


vSub :: [Int] -> [Int] -> [Int]
vSub = zipWith (-)


-- vpart limit xs
-- return all partitions of xs that smaller than limit
vpart :: [Int] -> [Int] -> [[[Int]]]
vpart limit xs = 
	case all (== 0) xs of 
		True  -> [[]]
		False -> concatMap (foo xs) heads
	where 
		heads :: [[Int]]
		heads = filter_loops limit xs 

		foo :: [Int] -> [Int] -> [[[Int]]]
		foo xs h = cat h $ vpart h (vSub xs h) 

vPart x = vpart x x 

test =
	let a = [0, 1] :: [Int]
	in assert ([[a]] == vpart a a)  "foo"
	

intPart :: Int -> [[Int]]
intPart = map(map head) . vPart . return 


primes :: [Int]
primes = 2 : filter isPrime [3,5..]

isPrime :: Int -> Bool
isPrime x = not $ any (`divide` x) lst
	where 
		n 		= floor  $ sqrt $ fromIntegral x
		lst 	= takeWhile (<= n) primes

divide x y = 0 == (y `mod` x)

-- return prime factors and their powers 
primeFactors :: Int -> M.Map Int Int
primeFactors 1 = M.empty
primeFactors n = 
	case find (`divide` n) primes of
		Just f -> M.insertWith (+) f 1 (primeFactors $ n `div` f)
		Nothing -> error "no"

-- return a tuple of keys and values
primesPowers :: M.Map Int Int -> ([Int], [Int])
primesPowers m = (M.keys m, M.elems m)

factorPartition :: Int -> [[Int]]
factorPartition n = map (map toFactor) $ vPart  powers
	where 
		pp = primesPowers  $ primeFactors n
		primes :: [Int]
		primes = fst pp
		powers :: [Int]
		powers = snd pp
		toFactor :: [Int] -> Int
		toFactor = product . zipWith (^) primes 

toSize :: Int -> [Int]  -> Int
toSize  prod  part = prod - sum part + length part

-- given n, return a map from size of 	
sizeToProd :: Int -> M.Map Int Int
sizeToProd n = M.fromList $ zip sizes [n,n..]
	where 
		sizes = filter (/= 1 ) $ map (toSize n) $ factorPartition n

firstP n = foldl (M.unionWith min) M.empty (take n $ map sizeToProd [2,3..])

let d = firstP 13000
sum .nub $ map (d M.! ) ([2..12000] :: [Int])
