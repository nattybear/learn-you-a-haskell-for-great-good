newtype First a = First { getFirst :: Maybe a }
  deriving (Eq, Ord, Read, Show)
