module RecursiveData (
    Tree(..),
    buildTreeFromList
    ) where

data List a = Empty
            | Cons a (List a)
            deriving (Eq, Read, Show, Ord)

-- Just to show how to make an infix operator
infixr 5 :-:
data ListInfix a = EmptyInfix
                 | a :-: (ListInfix a)
                 deriving (Eq, Read, Show, Ord)

-- Concat with List a
concatList :: List a -> List a -> List a 
concatList Empty ys = ys 
concatList (Cons x xs) ys = Cons x (concatList xs ys)

-- Binary Search Tree
data Tree a = Leaf 
            | Branch a (Tree a) (Tree a)
            deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Branch x Leaf Leaf

insertTree :: (Ord a) => a -> Tree a -> Tree a 
insertTree x Leaf = singleton x 
insertTree x (Branch y left right)
    | x <= y    = Branch y (insertTree x left) right 
    | otherwise = Branch y left (insertTree x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem _ Leaf = False
treeElem x (Branch y left right)
    | x == y    = True
    | x < y     = treeElem x left 
    | otherwise = treeElem x right 

buildTreeFromList :: (Ord a) => [a] -> Tree a 
buildTreeFromList = foldr insertTree Leaf

-- treeToList :: Tree a -> [a]
-- treeToList Leaf = []
-- treeToList (Branch x left right) = x : (treeToList left) ++ (treeToList right)

-- buidListFromTree :: Tree a -> [a]
-- buidListFromTree xs = foldr f [] xs where
--     f x acc = x : acc