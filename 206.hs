import NumUtils

good :: Int -> Bool
good a = (a * a) 
	|> digits 
	|> zip [0..] 
	|> filter (\(i, _) -> i `mod` 2 == 0) 
	|. snd 
	|> (== [1,2,3,4,5,6,7,8,9,0])

test :: Int -> Bool
test n = good (n * 100 + 30 ) || good (n * 100 + 70)	

f :: Int
f = [10000000..13900000] |> filter test |> head

main :: IO()
main = f |> show |> print