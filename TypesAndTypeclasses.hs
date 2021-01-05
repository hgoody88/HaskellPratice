module TypesAndTypeclasses where

data Shape =  Circle Float Float Float 
            | Rectangle Float Float Float Float 
            deriving Show

data Point = Point Float Float deriving Show

data Shape2 = Circle2 Point Float 
            | Rectangle2 Float Float Float 
            deriving Show

-- Record a person's details : 
-- First name, last name, age, height, 
-- weight, favourite ice cream  

-- Using record syntax

data Person = Person { firstName :: String
                     , lastName  :: String
                     , age       :: Int
                     , height    :: Float
                     , flavour   :: String
                     } deriving (Show)

-- Type parameters
data Vector a = Vector a a a deriving (Show)

vectorAdd :: (Num t) => Vector t -> Vector t -> Vector t 
vectorAdd (Vector i j k) (Vector x y z) = Vector (i+x) (j+y) (k+z)

-- Deriving
data Day = Mon
         | Tue
         | Wed
         | Thur
         | Fri
         | Sat
         | Sun
         deriving (Eq, Ord, Show, Read, Bounded, Enum)