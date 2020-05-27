module HaskellInterface
    ( callAllMethods
    ) where

foreign import ccall "getACoolNumber"
  getACoolNumber :: Int


callAllMethods :: IO ()
callAllMethods = do
  putStrLn . show $ getACoolNumber
