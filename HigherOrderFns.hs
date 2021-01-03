module HigherOrderFns where

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTenInfix :: (Floating a) => a -> a
divideByTenInfix = (/10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- This is in the prelude but useful to see
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- This one you could probably work out but I thought it was clever
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

-- Map
map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = f x : map' f xs

-- Filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs) 
        | f x       = x : filter' f xs 
        | otherwise = filter' f xs

-- Example of filter
largestDivisible :: (Integral a) => a 
largestDivisible = head (filter' p [100000, 99999 ..])
    where p x = x `mod` 3829 == 0

-- Lambdas
addOne :: (Num a) => a -> a 
addOne x = x + 1

addOne' :: (Num a) => a -> a
addOne' = \x -> x + 1

flip'' :: (a -> b -> c) -> b -> a -> c 
flip'' f = \x y -> f y x 