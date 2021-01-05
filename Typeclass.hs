module Typeclass where 

-- MAKE SURE YOU UNDERSTAND THE DIFFERENCE BETWEEN:
-- Typeclass, Type, Type Synonym
-- definition of Eq (using EqualClass) is as follows:

class EqualClass a where
    (==) :: a -> a -> Bool 
    (/=) :: a -> a -> Bool 
    x == y = not (x /= y)
    x /= y = not (x == y)

data TrafficLight = Red | Amber | Green

-- manually making type TrafficLight and instance of typeclass EqualClass

instance EqualClass TrafficLight where 
    Red   == Red   = True
    Amber == Amber = True
    Green == Green = True
    _     == _     = False

-- If we're going to use (==) on m, it must be a type that 
-- is an instance of EqualClass too.
instance (EqualClass m) => EqualClass (Maybe m) where
    Just x  == Just y  = x == y 
    Nothing == Nothing = True 
    _       == _       = False

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False 
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

instance YesNo Bool where
    yesno = id