data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

instance Functor Tree where
  fmap _ EmptyTree = EmptyTree
  fmap f (Node x left right) = Node (f x) (f <$> left) (f <$> right)
