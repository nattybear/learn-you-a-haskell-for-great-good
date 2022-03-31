newtype Pair b a = Pair { getPair :: (a, b) }

instance Functor (Pair b) where
  fmap f (Pair (x, y)) = Pair (f x, y)
