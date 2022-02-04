sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
