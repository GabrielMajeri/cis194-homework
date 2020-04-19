import qualified Homework1 as HW1
import qualified Homework2 as HW2
import qualified Homework3 as HW3
import qualified Log as Log

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

    describe "Homework 2" $ do
        describe "parseMessage" $ do
            it "parses error messages" $
                HW2.parseMessage "E 2 562 help help" `shouldBe` Log.LogMessage (Log.Error 2) 562 "help help"
            it "parses info messages" $
                HW2.parseMessage "I 29 la la la" `shouldBe` Log.LogMessage Log.Info 29 "la la la"
            it "parses unknown messages" $
                HW2.parseMessage "This is not in the right format" `shouldBe` Log.Unknown "This is not in the right format"

    describe "Homework 3" $ do
        describe "skips" $ do
            it "works with letter strings" $
                HW3.skips "ABCD" `shouldBe` ["ABCD", "BD", "C", "D"]
            it "works with strings of letters and symbols" $
                HW3.skips "hello!" `shouldBe` ["hello!", "el!", "l!", "l", "o", "!"]
            it "works on singleton lists" $
                HW3.skips [1] `shouldBe` [[1]]
            it "works with list of length 2" $
                HW3.skips [True, False] `shouldBe` [[True, False], [False]]
            it "ignores empty lists" $
                HW3.skips [] `shouldBe` ([] :: [[()]])
        describe "localMaxima" $ do
            it "works on a list" $
                HW3.localMaxima [2, 9, 5, 6, 1] `shouldBe` [9, 6]
            it "returns the unique maximum" $
                HW3.localMaxima [2, 3, 4, 1, 5] `shouldBe` [4]
            it "doesn't return anything when there are no local maxima" $
                HW3.localMaxima [1, 2, 3, 4, 5] `shouldBe` ([] :: [Integer])
        describe "histogram" $ do
            it "works with a small list" $
                HW3.histogram [1, 1, 1, 5] `shouldBe` (unlines [
                    " *        ",
                    " *        ",
                    " *   *    ",
                    "==========",
                    "0123456789"
                ])
            it "works with a big list" $
                HW3.histogram [1, 4, 5, 4, 6, 6, 3, 4, 2, 4, 9] `shouldBe` (unlines [
                    "    *     ",
                    "    *     ",
                    "    * *   ",
                    " ******* *",
                    "==========",
                    "0123456789"
                ])
