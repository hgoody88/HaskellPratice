module Folds where 

-- Examples

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a 
product' = foldr1 (*)

filter' :: (Ord a) => (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x acc -> if f x then x : acc else acc) []

head' :: [a] -> a 
head' = foldl1 (\acc _ -> acc) 

last' :: [a] -> a 
last' = foldr1 (\_ acc -> acc)