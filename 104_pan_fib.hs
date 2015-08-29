import NumUtils
import Data.List

--import qualified Data.Vector as B
--bv = B.replicate 10 False
pan :: Integer -> Bool
pan n = (n `mod` 1000000000) |> fromIntegral |> digits |> sort |> (== [1..9])

first9 :: Integer -> Integer
first9 n | n < 1000000000 = n
		 | otherwise      = first9 (n `div` 10)

type I3 = (Int, Integer, Integer)
next :: I3 -> I3
next (i,  x1, y1) = (i+1, y1, x1+y1)

t1 :: I3 -> Integer
t1 (_,x,_) = x

main :: IO ()
main = iterate next (1, 1,1) |> filter ( pan . t1 ) |> filter (pan . first9.  t1) |> take 1 |> show |> print
