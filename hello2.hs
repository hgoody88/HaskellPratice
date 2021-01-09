-- main = do
--     putStrLn "Hello, name?"
--     name <- getLine
--     putStrLn ("Hello, " ++ name)

main = do
    a <- return "yes"
    putStrLn a