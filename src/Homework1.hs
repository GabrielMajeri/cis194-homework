module Homework1 where

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

sumDigits :: [Integer] -> Integer
sumDigits = sum . concat . map toDigitsRev

validate :: Integer -> Bool
validate n = checksum `mod` 10 == 0
    where
        checksum = sumDigits (doubleEveryOther (toDigits n))
