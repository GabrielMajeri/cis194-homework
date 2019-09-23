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
