> module Recursion where

This is going to give a few examples of Recursion

Maximum fn (returns max value in list)

> max' :: (Ord a) => [a] -> a
> max' [] = error "Nothing in this list"
> max' [x] = x
> max' (x:xs) 
>   | x > maxTail = x
>   | otherwise  = maxTail
>   where maxTail = max' xs

It's better to keep the max' xs as a fn declared in the where 
so you only have to define the method once.

If you just use the max fn you get all the guard stuff for free.

Replicate an element n times

> replicate' :: (Num i, Ord i) => i -> a -> [a]
> replicate' i element
>   | i < 0     = error "How do you replicate negative times?"
>   | i == 0    = []
>   | otherwise = element : (replicate' (i-1) element) 

Take.
This is really powerful because it's combining guards and pattern matching.

> take' :: (Num n, Ord n) => n -> [a] -> [a]
> take' n _
>       | n <= 0 = []
> take' _ []     = []
> take' n (x:xs) = x : take' (n-1) xs

Reverse.

> reverse' :: [a] -> [a]
> reverse' [] = []
> reverse (x:xs) = reverse' xs ++ [x]

Elem - see if element exists in list 

> elem' :: (Ord a) => a -> [a] -> Bool
> elem' _ []  = False
> elem' x (y:ys) 
>       | x == y = True
>       | otherwise = elem' x ys

Quicksort
Using list comprehension

> quicksort :: (Ord a) => [a] -> [a]
> quicksort [] = []
> quicksort (x:xs) = 
>   let smallerSorted = quicksort [y | y <- xs, y <= x]
>       biggerSorted  = quicksort [y | y <- xs, y > x]
>   in  smallerSorted ++ [x] ++ biggerSorted