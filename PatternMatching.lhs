> module PatternMatching where

Example of creating own head fn using PatternMatching
NB: if you use a pattern ever that include the (:) for a list, then remember to check empty list first

> head' :: [a] -> a
> head' [] = error "Oh no, nothing here..."
> head' (x:_) = x

> length' :: (Num b) => [a] -> b
> length' [] = 0
> length' (_:xs) = 1 + length' xs

> sum' :: (Num a) => [a] -> a
> sum' [] = 0
> sum' (x:xs) = x + sum' xs 

Showing how to use Guards (Guards aren't the same as pattern matching but similar)
And the where key word

> bmi :: (RealFloat a) => a -> a -> String
> bmi height weight 
>   | bmiCalc < 18 = "Underweight"
>   | bmiCalc < 26 = "Normal"
>   | otherwise    = "Overweight"
>   where bmiCalc = weight / height ^ 2

Let key word:
Let <binding> in <expression>

> cylinder :: (RealFloat a) => a -> a -> a
> cylinder r h = 
>   let sideArea = 2 * pi * r * h
>       topArea  = pi * r^2
>   in  sideArea + 2 * topArea

Can also use a let in list comprehension... though seems a bit complicated

> calcBmi :: (RealFloat a) => [(a, a)] -> [a]
> calcBmi xs = [ bmi | (height, weight) <- xs, let bmi = weight / height^2, bmi >= 26 ]

This last bit is just to explain what happens in pattern matching "under the hood".
Pattern matching is just syntatic sugar for case expression

case expression of pattern -> result 
                   pattern -> result 
                   ...

So this:

> head'' :: [a] -> a 
> head'' xs = case xs of []    -> error "Oh no, nothing here..." 
>                        (x:_) -> x

is the same as the head' fn at the top.