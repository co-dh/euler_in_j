import Data.List.Split

eb :: String -> Double
eb s = es * log bs
	where 
		[bs, es] = (map read $ splitOn "," s) :: [Double]


emax :: String -> String -> String
emax s t | eb s > eb t = s
		 | otherwise   = t


main = do
	s <- readFile "base_exp.txt"
	let ls = lines s
	print $ foldl emax "1,1" ls

