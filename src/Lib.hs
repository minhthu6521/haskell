module Lib
    ( someFunc, 
      firstOrEmpty,
      (+++),
      maxmin,
      factorial
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

firstOrEmpty :: [[Char]] -> [Char]
firstOrEmpty lst = if not (null lst) then head lst else "empty"


(+++) :: [a] -> [a] -> [a]
lst1 +++ lst2 = if null lst1 
                then lst2 
                else (head lst1) : (tail lst1 +++ lst2)

maxmin :: Ord b => [b] -> (b, b)
maxmin list = if null (tail list) 
              then (head list, head list) 
              else (if (head list) > fst (maxmin (tail list)) 
                    then head list 
                    else fst (maxmin (tail list)) 
                  , if (head list) < snd (maxmin (tail list)) 
                    then head list 
                    else snd (maxmin (tail list))
                    )

maxmin2 :: Ord a => [a] -> (a, a)
maxmin2 list =  let h = head list
              in if null (tail list)
                 then (h, h)
                 else ( if h > t_max then h else t_max
                      , if h < t_min then h else t_min )
                      where { t = maxmin (tail list) ; t_max = fst t ; t_min = snd t }

factorial :: Integer -> Integer
factorial 1 = 1
factorial 0 = 1
factorial n = abs (n) * factorial x 
            where x = (abs n) - 1