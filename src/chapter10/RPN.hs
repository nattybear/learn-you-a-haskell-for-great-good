solveRPN :: String -> Double
solveRPN = head . foldl foldingFunction [] . words
  where foldingFunction stack item = undefined
