multThree :: Int -> (Int -> (Int -> Int))
multThree x y z = x * y * z

multTwoWithNine = multThree 9

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100
