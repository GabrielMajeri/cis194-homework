module Homework2 where

import Log

parseMessage :: String -> LogMessage
parseMessage s = convert $ head wds
    where wds = words s
          firstArg = wds !! 1
          secondArg = wds !! 2
          convert ty
            | ty == "E" = LogMessage (Error (read $ firstArg)) (read $ secondArg) (drop (length (wds !! 0) + length (wds !! 1) + length (wds !! 2) + 3) s)
            | ty == "W" = LogMessage Warning (read $ firstArg) (drop (length (wds !! 0) + length (wds !! 1) + 2) s)
            | ty == "I" = LogMessage Info (read $ firstArg) (drop (length (wds !! 0) + length (wds !! 1) + 2) s)
            | otherwise = Unknown s
