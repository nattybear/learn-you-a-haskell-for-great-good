newtype Product a = Product { getProduct :: a }
  deriving (Eq, Ord, Read, Show, Bounded)
