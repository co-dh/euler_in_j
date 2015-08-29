import NumUtils
import Data.List.Split

type I2 = (Int, Int)
(*:) :: I2 -> I2 -> Int
(x0, x1) *: (y0, y1) = x0 * y1 - x1 * y0

(-:) :: I2 -> I2 -> I2
(x0, x1) -: (y0, y1) = (x0 - y0, x1 - y1)

idiv :: Int -> Int -> Float
idiv x y = fromIntegral x / fromIntegral y

inside :: I2 -> I2 -> I2 -> I2 -> Bool
inside p x y z = 0 < a && 0 < b && a + b < 1
	where
		u = y -: x
		v = z -: x
		q = p -: x
		a = (q *: v) `idiv` (u *: v)
		b = (q *: u) `idiv` (v *: u)

zero :: I2
zero = (0,0)

--line0 = "-340,495,-153,-910,835,-947"
--line1 = "-175,41,-421,-714,574,-645"

testLine :: String -> Bool
testLine line = inside zero (a,b) (c,d) (e,f)
	where
		[a,b,c,d,e,f] = line |> splitOn "," |. (read :: String -> Int)

main :: IO()
main = do
	content <- readFile "triangles.txt"
	lines content |> filter testLine |> length |> show |> print
