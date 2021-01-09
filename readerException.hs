import System.Environment  
import System.IO  
import System.IO.Error  
    
main = catchIOError toTry handler  
                
toTry :: IO ()  
toTry = do (fileName:_) <- getArgs  
           contents <- readFile fileName  
           putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"  
    
handler :: IOError -> IO ()  
handler e 
        | isDoesNotExistError e = putStrLn "Whoops, had some trouble!"
        | otherwise = ioError e