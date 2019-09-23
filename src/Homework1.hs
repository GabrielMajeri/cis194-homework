module Homework1 where

import Debug.Trace

toDigits :: Integer -> [Integer]
toDigits n = reverse $ toDigitsRev n

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n <= 0 = []
    | otherwise = (n `mod` 10) : toDigitsRev (n `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther arr = reverse $ doubleFromStart $ reverse arr
    where
        doubleFromStart [] = []
        doubleFromStart (x:[]) = [x]
        doubleFromStart (x:y:xs) = [x, y * 2] ++ (doubleFromStart xs)
