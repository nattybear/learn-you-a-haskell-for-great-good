solveRPN :: String -> Double
solveRPN expression = head (foldl foldingFunction [] (words expression))
  where foldingFunction stack item = undefined
