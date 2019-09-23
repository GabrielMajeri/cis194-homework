import qualified Homework1 as HW1

import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Homework 1" $ do
        describe "toDigits" $ do
            it "converts a positive integer to an array of its digits" $
                HW1.toDigits 1234 `shouldBe` [1, 2, 3, 4]
            it "converts 0 to an empty list" $
                HW1.toDigits 0 `shouldBe` []
            it "converts negative numbers to an empty list" $
                HW1.toDigits (-17) `shouldBe` []
        describe "toDigitsRev" $ do
            it "converts a positibe integer to the reverse array of its digits" $
                HW1.toDigitsRev 1234 `shouldBe` [4, 3, 2, 1]
        describe "doubleEveryOther" $ do
            it "doubles every other number from the right" $
                HW1.doubleEveryOther [8, 7, 6, 5] `shouldBe` [16, 7, 12, 5]
            it "works with odd length arrays" $
                HW1.doubleEveryOther [1, 2, 3] `shouldBe` [1, 4, 3]
        describe "sumDigits" $ do
            it "sums the digits of an array of numbers" $
                HW1.sumDigits [16, 7, 12, 5] `shouldBe` 22
        describe "validate" $ do
            it "accepts correct credit card numbers" $
                HW1.validate 4012888888881881 `shouldBe` True
            it "rejects invalid credit card numbers" $
                HW1.validate 4012888888881882 `shouldBe` False
        describe "hanoi" $ do
            it "solves the problem for 1 disc" $
                HW1.hanoi 1 "x" "y" "z" `shouldBe` [("x", "y")]
            it "solves the problem for 2 discs" $
                HW1.hanoi 2 "a" "b" "c" `shouldBe` [("a","c"), ("a","b"), ("c","b")]
            it "solution for 15 discs has right length" $
                length (HW1.hanoi 15 "0" "1" "2") `shouldBe` (2^15 - 1)
