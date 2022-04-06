import Data.List

solveRPN :: String -> Double
solveRPN = head . foldl foldingFunction [] . words

foldingFunction = undefined
