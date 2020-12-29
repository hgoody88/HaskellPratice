module Lists where

-- concat
concat' :: [a] -> [a] -> [a]
concat' xs ys = xs ++ ys

-- cons
cons' :: a -> [a] -> [a]
cons' x xs = x:xs

-- extract
extract :: [a] -> Int -> a
extract xs i = xs !! i

-- compare
-- you can use (<, <=, >=, >) to compare lists

-- useful fns: (head, tail, last, init, length, 
--              null, reverse, take, drop, minimum,
--              maximum, sum, product, elem)

-- ranges: cycle and repeat
-- Example of a range
first20 :: [Int]
first20 = [1 .. 20]

-- They can be infinite.
-- This is powerful when combined with take

takeN :: Int -> [Int]
takeN n = take n [1..]

takeCycle :: Int -> [a] -> [a]
takeCycle n xs = take n (cycle xs)

-- also useful (repeat, replicate)

-- comprehensions
-- Maths: S = {2.x | x e N, x <= 10}
first10even :: [Int]
first10even = [x*2 | x <- [1..10]]

weirdModdy :: [Int]
weirdModdy = [x | x <- [1..100], x `mod` 7 == 3]

-- what do you think will happen here?
huge :: [Int]
huge = [x*y | x <- [2,3,4], y <- [1,0,1]]

length' :: [a] -> Int
length' xs = sum [1 | _ <- xs]

-- remember that strings are lists
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase str = [t | t <- str, t `elem` ['A' .. 'Z']]

-- you can have nested comprehensions
removeOddNumbers :: [[Int]] -> [[Int]]
removeOddNumbers xss = [ [x | x <- xs, even x] | xs <- xss]

-- tuples
-- pairs :: (fst, snd)
-- zip :: [a] -> [b] -> [(a,b)]

-- fn that gets the right angled triangles with perimeter 24
rightTriangles :: [(Int, Int, Int)]
rightTriangles = [(a, b, c) | a <- [1..100], 
                              b <- [1..100],
                              c <- [1..100],
                              a^2 + b^2 == c^2,
                              a + b + c == 24]
