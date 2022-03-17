data Section = Section
             { getA :: Int
             , getB :: Int
             , getC :: Int
             } deriving (Show)

type RoadSystem = [Section]

heathrowToLondon :: RoadSystem
heathrowToLondon = [ Section 50 10 30
                   , Section 5 90 20
                   , Section 40 20 25
                   , Section 10 8 0
                   ]

data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

optimalPath :: RoadSystem -> Path
optimalPath = undefined

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep = undefined
