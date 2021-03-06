import Prelude hiding (Monad, (>>=), (>>), return, fail)

class Monad m where
    return :: a -> m a

    (>>=) :: m a -> (a -> m b) -> m b

    (>>) :: m a -> m b -> m b
    x >> y = x >>= \_ -> y

    fail :: String -> m a
    fail message = error message

instance Monad Maybe where
    return x = Just x
    Nothing >>= f = Nothing
    Just x >>= f = f x
    fail _ = Nothing

type Birds = Int 
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole 
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                   = Nothing 

landRight :: Birds -> Pole -> Maybe Pole 
landRight n (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right + n)
    | otherwise                   = Nothing 
