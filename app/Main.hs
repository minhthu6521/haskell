module Main where

import Lib

main :: IO()
main = do
          print (firstOrEmpty [])
          return ()


-- main :: IO Int
--main = return (doubleMe 2)

-- main :: IO Int
--main = do 
--          print (doubleMe 2)
--          return (doubleMe 2)

-- main :: IO ()
--main = do
--          print (doubleMe 2)
--          return ()

-- main :: IO ()
--main = do
--          print (doubleMe 2)

-- main :: IO ()
--main = print (doubleMe 2)

-- main :: IO ()
--main = do
--         print "Hello"
--         print (doubleMe 2)
--         return ()

-- main :: IO String
--main = do
--         print "Hello"
--         print (doubleMe 2)
--         return "Hello"