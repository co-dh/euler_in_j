module Main where

{- 
1 2 3 4  + - * 
1 2 7 - * 
1 -5 * 
-5

-}

data Operator = Add | Minus | Mul | Div
	deriving (Eq, Show)


perm :: (Eq a) => [a] -> [[a]]
perm [] = [[]]
perm xs = concatMap f [0.. length xs - 1]
	where
		f n = map ((xs !! n) : ) $ perm $ del n xs

-- remove an element from a list a
del :: Int -> [a] -> [a]
del n xs = ys ++ tail zs
	where (ys, zs) = splitAt n xs

main :: IO ()
main = putStrLn "Hello World"

