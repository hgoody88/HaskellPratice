import Prelude 

-- class (Functor f) => Applicative f where  
--     pure :: a -> f a  
--     (<*>) :: f (a -> b) -> f a -> f b  

-- instance Applicative Maybe where
--     pure = Just
--     Nothing <*> _ = Nothing 
--     (Just f) <*> something = fmap f something

-- instance Applicative [] where 
--     pure x = [x]
--     fs <*> xs = [f x | f <- fs, x <- xs]

-- instance Applicative IO where
--     pure = return 
--     a <*> b = do
--         f <- a 
--         x <- b 
--         return (f x)

sequenceA' :: (Applicative f) => [f a] -> f [a]
sequenceA' [] = pure []
sequenceA' (x:xs) = (:) <$> x <*> sequenceA' xs