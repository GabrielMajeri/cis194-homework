module Homework1 where

import Debug.Trace

toDigits :: Integer -> [Integer]
toDigits = reverse . toDigitsRev

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n <= 0 = []
    | otherwise = lastDigit : (toDigitsRev remainder)
        where
            lastDigit = n `mod` 10
            remainder = n `div` 10

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . doubleFromStart . reverse
    where
        doubleFromStart [] = []
        doubleFromStart (x:[]) = [x]
        doubleFromStart (x:y:xs) = [x, y * 2] ++ (doubleFromStart xs)
