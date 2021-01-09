module Functor where
import Prelude hiding (Functor, fmap)
import RecursiveData

-- NB: f is not a concrete type here!
class Functor f where
    fmap :: (a -> b) -> f a -> f b

-- A list needs an a, so list is f
instance Functor [] where 
    fmap = map

-- This is where Haskell is a bit dumb.
-- The 'f' in the typeclass definition refers to the type constructor.
-- The 'f' in the Maybe instance refers to the first argument
-- of fmap, f :: (a -> b)
instance Functor Maybe where 
    fmap f (Just x) = Just (f x)
    fmap _ Nothing = Nothing 

instance Functor Tree where
    fmap _ Leaf = Leaf
    fmap f (Branch x left right) 
        = Branch (f x) (fmap f left) (fmap f right)

-- (Either a) is a type constructor that takes one type parameter.
instance Functor (Either a) where
    fmap f (Right x) = Right (f x)
    fmap _ (Left x)  = Left x

-- Type-foo

class Tofu t where
    tofu :: j a -> t a j

-- Workout the kinds of each {t, j, a}

data Frank a b = Frank { frankField :: b a} deriving (Show)

instance Tofu Frank where
    tofu = Frank

data Barry t k p = Barry { 
                    yabba :: p, 
                    dabba :: t k }

instance Functor (Barry t k) where
    fmap f (Barry {yabba = x, dabba = ys}) = Barry {yabba = (f x), dabba = ys}

instance Functor IO where
    fmap f action = do 
        result <- action
        return (f result)