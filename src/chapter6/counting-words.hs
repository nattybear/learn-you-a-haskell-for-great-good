import Data.List

wordNums :: String -> [(String,Int)]
wordNums xs = map (\xs -> (head xs, length xs)) (group (sort (words xs)))
