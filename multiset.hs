import Data.Array.IArray
import Data.Tuple 
import Control.Arrow 
import Data.List

enumerate :: [a] -> [(Int, a)]
enumerate = zip [0,1..]

-- integer partition
-- partition of sum with numbers from parts.
-- return : array of numbers of copies of each part, with sum < max1
npart :: [Int] -> Int -> Int -> [[Int]]
npart []        sum1 max1 = [[sum1]]
npart (p:parts) sum1 max1 = concatMap f idx_psum
    where
        idx_psum :: [(Int, Int)]
        idx_psum = zip [0..max1-1]  [sum1,sum1-p..0]
        f :: (Int, Int) -> [[Int]]
        f (idx, psum ) =  filter (\x-> sum x < max1 ) $ map ( idx :) $ npart parts psum (max1 - idx)

digits :: Int -> [Int]
digits x | x < 10    = [x]
         | otherwise = digits d ++ [m]
            where (d,m) = divMod x 10

undigits :: [Int] -> Int
undigits = foldl (\a b -> a*10 + b) 0

type A1 = Array Int Int
-- array[idx]--
dec :: [Int] -> Int -> [Int]
dec lst idx = elems $ a // [(idx, a ! idx - 1)]
    where 
        a :: A1
        a = array (0, length lst - 1) $ enumerate lst

-- multiset permutation. 
mult_perm :: ([Int], [a]) -> [[a]]
mult_perm (cnts1, elements) = p cnts1 
    where
        --p :: [Int] -> [[a]]
        p cnts  | all (== 0) cnts = [[]]
                | otherwise       = concatMap y ic
                where 
                    --ic :: [(Int, Int)]
                    ic = filter (\(i,c)-> (c > 0)) $ enumerate cnts

                    --y :: (Int, Int) -> [[a]]
                    y (i,c) = map ((elements !! i) :) $ p $ dec cnts i 

                
replicateMany :: [a] -> [Int] -> [a]
replicateMany elems cnt = concat $ zipWith replicate cnt elems

list_to_multiset :: Ord a => [a] -> ([Int], [a])
list_to_multiset = swap . unzip . (map (head &&& length)) . group . sort

type MultiSet = ([Int], [Int])

add0 :: MultiSet -> MultiSet
add0 (cnts, elems) 
    | n > 0     = (n : cnts, 0 : elems)
    | otherwise = (cnts, elems)
    where n = 7 - sum cnts --7 before

-- all permutaion of number with 0 added
perm1 :: [Int] -> [Int]
perm1 = map undigits . mult_perm . add0 . list_to_multiset

nums = [9,8..1] :: [Int]
squares = map (\x->x*x) [9,8..2] :: [Int]

-- sq_part n return { x | sum square digits x = n }
sq_part :: Int -> [Int]
sq_part n | n > 567 = []
          | otherwise = npart squares n 8 |. replicateMany nums |> filter (\x-> length x <=7) |. perm1 |> concat |> filter (\x -> x /= n)
    

x |. f = map f x
x |> f = f x

bread_first_search :: (Int -> [Int]) -> [Int] -> [Int]
bread_first_search _ [] = []
bread_first_search children roots  = roots ++ bread_first_search children child 
    where child = concatMap children roots

--dfs :: [Int] -> (Int -> [Int]) -> [Int]
--dfs roots children = (dfs $ concatMap children roots) ++ roots
child :: Int -> [Int]
child x = [2*x , 2*x+1]

main1 n = bread_first_search sq_part [1]  |> take n |> print
main  = bread_first_search sq_part [1]  |> length |> print 
cs = concatMap sq_part
