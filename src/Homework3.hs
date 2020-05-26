module Homework3 where

import Data.List (tails)

-- | For a given n, returns a predicate for checking if a number is a multiple of n.
isNth :: Int -> Int -> Bool
isNth n x = x `mod` n == 0

-- | For a given n, returns every n-th element in the array
selectEveryNth :: Int -> [a] -> [a]
selectEveryNth n = map snd . filter ((isNth n) . fst) . zip [1..]

{-|
    Takes a list and generates sub-lists by taking every element,
    then every second one, then every third one, etc. up to the nth one.
-}
skips :: [a] -> [[a]]
skips array = map (\n -> selectEveryNth n array) [1..(length array)]

{-|
    Returns sliding windows of length m.
    Taken from https://stackoverflow.com/a/27733778/5723188
-}
windows :: Int -> [a] -> [[a]]
windows m = foldr (zipWith (:)) (repeat []) . take m . tails

-- | Predicate for checking if a number is a local maximum of a sequence of 3 numbers.
isLocalMaximum :: Ord a => [a] -> Bool
isLocalMaximum (a:b:c:[]) = a < b && b > c

-- | Extracts the middle element from a window of length 3.
middle :: [a] -> a
middle (_:b:_:[]) = b

{-|
    Computes the values of the local maxima of a list.
    A local maximum is a value strictly greater than the one before and after it.
-}
localMaxima :: [Integer] -> [Integer]
localMaxima = map middle . filter isLocalMaximum . windows 3

{-|
    Given a list of integers, computes a string representation of its histogram.
-}
histogram :: [Integer] -> String
histogram = undefined
