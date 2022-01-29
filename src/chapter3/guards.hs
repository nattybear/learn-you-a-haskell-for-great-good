bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= 18.5 = "You're underweight, eat more!"
  | bmi <= 25.0 = "Looking good!"
  | bmi <= 30.0 = "You're overweight. Let's work out together!"
  | otherwise = "You're obese. Go see a doctor."
  where bmi = weight / height ^ 2

max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b = b
  | otherwise = a

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a == b    = GT
  | a <= b    = LT
  | otherwise = GT
