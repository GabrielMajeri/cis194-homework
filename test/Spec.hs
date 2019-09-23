import qualified Homework1 as HW1

import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Homework 1" $ do
        it "converts a positive integer to an array of its digits" $
            HW1.toDigits 1234 `shouldBe` [1, 2, 3, 4]
