import NumUtils
import Control.Parallel

reversible :: Int -> Bool
reversible n | n `mod` 10 == 0 = False
			 | even (firstDigit n + n `mod` 10 ) = False
			 | otherwise	 = all odd $ digits $ n + r
	where
		ns = digits n
		rns = reverse ns
		r = undigits rns

firstDigit :: Int -> Int
firstDigit n | n < 10    = n
			 | otherwise = firstDigit $ n `div` 10

foo = f `par`(g `pseq` (g + f))
	where
		f = [1..500000000] 		|> filter reversible |> length
		g = [500000001..1000000000] |> filter reversible |> length
main :: IO ()
--main = [1..10000000] |> filter reversible |> length |> show |> print
main = foo |> show |> print