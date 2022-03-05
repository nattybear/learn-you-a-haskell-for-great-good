import System.Environment
import System.Directory
import System.IO
import Data.List
import Control.Exception

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch command = doesntExist command

doesntExist :: String -> [String] -> IO ()
doesntExist command _ =
  putStrLn $ "The " ++ command ++ " command doesn't exist"

main = do
  args <- getArgs
  if length args > 0
    then
      let command:argList = args
      in dispatch command argList
    else
      putStrLn "The todo program takes one command: \
               \add, view, remove"

add :: [String] -> IO ()
add [fileName, todoItem] = do
  b <- doesFileExist fileName
  if b
    then appendFile fileName (todoItem ++ "\n")
    else putStrLn $ fileName ++ " does not exist"
add _ = putStrLn "The add command takes exactly two arguments"

view :: [String] -> IO ()
view [fileName] = do
  b <- doesFileExist fileName
  if b
    then do
      contents <- readFile fileName
      let todoTasks = lines contents
          numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                          [0..] todoTasks
      putStr $ unlines numberedTasks
    else
      putStrLn $ fileName ++ " does not exist"
view _ = putStrLn "The view command takes one argument"

remove :: [String] -> IO ()
remove [fileName, numberString] = do
  b <- doesFileExist fileName
  if b
    then do
      contents <- readFile fileName
      let todoTasks = lines contents
          number = read numberString
          newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
      bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
          hClose tempHandle
          removeFile tempName)
        (\(tempName, tempHandle) -> do
          hPutStr tempHandle newTodoItems
          hClose tempHandle
          removeFile fileName
          renameFile tempName fileName)
    else
      putStrLn $ fileName ++ " does not exist"
remove _ = putStrLn "The remove command takes exactly two arguments"
