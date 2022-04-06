type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Either Pole Pole
landLeft n (left, right)
  | abs ((left + n) - right) < 4 = Right (left + n, right)
  | otherwise                    = Left (left + n, right)

landRight :: Birds -> Pole -> Either Pole Pole
landRight n (left, right)
  | abs (left - (right + n)) < 4 = Right (left, right + n)
  | otherwise                    = Left (left, right + n)

routine :: Either Pole Pole
routine = do
  start <- return (0, 0)
  first <- landLeft 4 start
  second <- landRight 2 first
  landLeft 1 second
