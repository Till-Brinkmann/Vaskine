module Main where

import Development.Shake
import Development.Shake.FilePath
import System.Info
import System.Directory
import Data.Tuple.Extra
import Language.Haskell.TH

main :: IO()
main = shakeArgs shakeOptions $ do
  want ["build_csrc_a"]

  phony "build_csrc_o" $ do
    cmd $ "gcc -c -o" ++
      " build" </> "HaskellInterface" <.> "o" ++
      " csrc" </> "HaskellInterface" <.> "cpp" ++
      " -fPIC"

  phony "build_csrc_a" $ do
    need ["build_csrc_o"]
    cmd $ "ar rcs" ++
      " build" </> "libHaskellInterface" <.> "a" ++
      " build" </> "HaskellInterface" <.> "o"
