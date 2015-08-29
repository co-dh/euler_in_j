import NumUtils
import Data.List
increasing :: [Int] -> Bool
increasing xs = sort xs == xs

decreasing :: [Int] -> Bool
decreasing xs = sortBy (flip compare) xs == xs

notBouncy1 :: [Int] -> Bool 
notBouncy1 xs = increasing xs || decreasing xs

notBouncy :: Int -> Bool
notBouncy n | n < 100   = True
 			| otherwise = n |> digits |> notBouncy1 
nbs :: [Int]
nbs = [1..100] ++ filter notBouncy [101..]

idiv :: Int -> Int -> Float
idiv x y = fromIntegral x / fromIntegral y

main :: IO ()
main =  ([1..21780] :: [Int]) |> filter notBouncy |> length |> show |> print 

-- zipWith idiv  [1 :: Int ..] nbs |> takeWhile (> 0.01) |> length  ==> 15870

