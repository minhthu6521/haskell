units, teens, tens :: [String]
units = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teens = ["ten", "eleven", "twelve", "thirteen", "fourthteen", "fifthteen", "seventeen", "eighteen", "nineteen"]
tens = ["twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"]

-- case 0 <= n < 10
convert1 :: Int -> String
convert1 n = units!!n

-- case 0 <= n < 100
digits2 :: Int -> (Int, Int)
digits2 n = (div n 10, mod n 10)

combine2 :: (Int, Int) -> String
combine2 (t, u)
    | t == 0    = units!!u
    | t == 1    = teens!!u
    | 2 <= t && u == 0 = tens!!(t-2)
    | otherwise = tens!!(t-2) ++ "-" ++ units!!u

convert2 :: Int -> String
convert2 = combine2 . digits2

convert2Alt :: Int -> String
convert2Alt n 
    | t == 0            = units!!u
    | t == 1            = teens!!u
    | 2 <= t && u == 0  = tens!!(t-2)
    | otherwise         = tens!!(t-2) ++ "-" ++ units!!u
    where (t, u) = (n `div` 10, n `mod` 10)

-- case 0 <= n < 1000
convert3 :: Int -> String
convert3 n 
    | h == 0     = convert2 u
    | u == 0     = units!!h ++ " hundred"
    | otherwise  = units!!h ++ " hundred and " ++ convert2 u
    where (h, u) = (n `div` 100, n `mod` 100)

-- case 0 <= n < 1 000 000
convert6 :: Int -> String
convert6 n
    | t == 0        = convert3 units
    | u == 0        = convert3 t ++ " thousand"
    | otherwise     = convert3 t ++ " thousand and " ++ convert3 units
    where (t, u) = (n `div` 1000, n `mod` 1000)
