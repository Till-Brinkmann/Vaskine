module Main where

import Development.Shake
import Development.Shake.FilePath
import System.Info
import System.Directory


main :: IO()
main = shakeArgs shakeOptions $ do

  want ["build"]
 
  phony "run" $ do
    need ["build_cpp"]
    cmd "stack run" :: Action ()
    need ["clean"]

  phony "install" $ do
    need ["build_cpp"]
    cmd "stack install" :: Action ()
    need ["clean"]

  phony "build" $ do
    need ["build_cpp"]
    cmd "stack build" :: Action ()
    need ["clean"]

  "build" </> "lib*.a" %> \out -> do
    let withoutLib = replaceBaseName out . drop 3 . takeBaseName $ out
    need [withoutLib -<.> "o"]
    cmd $ "ar rcs " ++ out ++ " " ++ withoutLib -<.> "o"

  "build" </> "*.o" %> \out -> do
    let fileInCSRC =  replaceDirectory out "csrc"
    need [fileInCSRC -<.> "cpp"]
    cmd $ "gcc -c -o " ++ out ++ " " ++ fileInCSRC -<.> "cpp" ++ fPICOption

  phony "clean" $ do
    putInfo "cleaning files"
    liftIO $ removeFiles "build" ["*.o", "*.a"]

  phony "build_cpp" $ do
    putInfo "building cpp files"
    dir <- liftIO getCurrentDirectory
    csrcFiles <- liftIO . listDirectory $ dir </> "csrc"
    let cppFiles = filter (isExtensionOf "cpp") csrcFiles
        cppFilesA = map (overFileName $ (-<.> "a") . (++) "lib") cppFiles
    need $ map (flip replaceDirectory "build") cppFilesA

overFileName :: (String -> String) -> FilePath -> FilePath
overFileName f p = replaceFileName p . f . takeFileName $ p

fPICOption :: String
fPICOption = if os == "windows"
                then ""
                else " -fPIC"
